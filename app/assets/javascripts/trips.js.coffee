# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# = require 'jquery-ui'
# = require 'highcharts'
# = require 'highcharts-ng'
# = require 'medium-editor'
# = require 'angular-file-upload'
# = require 'moment'
# = require 'moment/locale/es'
# = require 'angular-bootstrap-datetimepicker'
# = require 'angular-ui-sortable'
# = require 'ngmap'

# = require 'trips.actions'


app = angular.module("PlanificaViajes.Trips", ["ngSanitize", "highcharts-ng", "angularFileUpload", "ui.bootstrap.datetimepicker", "ngMap", "ui.sortable"])


app.controller "tripCtrl",
  ($scope, $http, FileUploader,$filter) ->


    $scope.trip = {}
    $scope.tripBackground = {}
    $scope.sharedUrl = ""


    $scope.$watch "trip", (->
      $scope.tripBackground = {'background-image':'url('+$scope.trip.image.url+')'}
      $scope.sharedUrl = location.href
    ), true

    uploader = $scope.uploader = new FileUploader(
      withCredentials: false
    )

    uploader.filters.push
      name: "imageFilter"
      fn: (item, options) -> #{File|FileLikeObject}
        type = "|" + item.type.slice(item.type.lastIndexOf("/") + 1) + "|"
        "|jpg|png|jpeg|bmp|gif|".indexOf(type) isnt -1


    $scope.onStartTimeSet = (newDate, oldDate) ->


      $scope.trip.startDate = newDate
      if newDate > $scope.trip.endDate
        $scope.trip.endDate = newDate



      info = {
        startDate: $filter('date')($scope.trip.startDate,'yyyy-MM-ddTHH:mm:ss:Z')
        endDate: $filter('date')($scope.trip.endDate,'yyyy-MM-ddTHH:mm:ss:Z')
      }

      $http.post("/api/t/"+$scope.trip.id+"/data/", info).success (data)->

        return

      return

    $scope.onEndTimeSet = (newDate, oldDate) ->
      $scope.trip.endDate = newDate
      if newDate < $scope.trip.startDate
        $scope.trip.startDate = newDate

      info = {
        startDate: $filter('date')($scope.trip.startDate,'yyyy-MM-ddTHH:mm:ss:Z')
        endDate: $filter('date')($scope.trip.endDate,'yyyy-MM-ddTHH:mm:ss:Z')
      }

      $http.post("/api/t/"+$scope.trip.id+"/data/", info).success (data)->

        return

      return

    uploader.onAfterAddingFile = (item) ->

      $(".uploader").fadeOut()
      uploader.uploadItem(item)
      return

    uploader.onSuccessItem = (fileItem, response, status, headers) ->
      $scope.trip = response
      return


    $scope.changeVisibility = (value) ->

      info = {
        visibility: value
      }
      $http.post("/api/t/"+$scope.trip.id+"/data/", info).success (data)->
        $("#sharedpreferences").fadeOut()
        $scope.trip.visibility = value
        return
      return

    $scope.toggleFavorite = () ->
      $scope.favorite = !$scope.favorite
      info = {
        fav: $scope.favorite
      }
      $http.post("/api/t/"+$scope.trip.id+"/data/", info).success (data)->

        return
      return
    $scope.saveDescription = ()->

      info = {
        description: $(".content.editable").html()
      }
      $http.post("/api/t/"+$scope.trip.id+"/data/", info).success (data)->
        $(".save-description").animate
          opacity: 0
        , 500
        # $(".content.editable").fadeOut()
        # $(".content.editable").fadeIn()

        return
      return


    $scope.saveTitle = () ->
      info = {
        title: $(".header-info h1").text()
      }
      window.document.title = info.title
      $http.post("/api/t/"+$scope.trip.id+"/data/", info).success (data)->
        $(".save-title").animate
          opacity: 0
        , 500
        $("h1.editable #typed-cursor").animate
          opacity: 1
        , 500
        return
      return

    $scope.removeTrip = () ->
      $("#modal-delete-trip").modal('hide')
      $http.delete("/api/t/"+$scope.trip.id+"/data/").success (data) ->
        window.location.href = "/u/"+$scope.username+"/"
        return
      return


    $scope.allUsers = []
    $scope.usersCanWrite = []
    $scope.loadEditors = () ->

      $http.get("/api/t/"+$scope.trip.id+"/editors").success (data) ->
        $scope.usersCanWrite = data
        return

      return

    $scope.addUserCanWrite = () ->
      if event.keyCode is 13 and $scope.addUserText
        info = {
          neweditor: $scope.addUserText
        }
        $http.post("/api/t/"+$scope.trip.id+"/neweditor", info).success (data) ->
          $scope.usersCanWrite = data
          $scope.addUserText = ""
          return
      return


    $scope.deleteUserCanWrite = (user_id) ->
      info = {
          oldeditor: user_id
      }
      $http.post("/api/t/"+$scope.trip.id+"/deleditor", info).success (data) ->
          $scope.usersCanWrite = data
          return
      return

    return

app.controller "mapCtrl",
  ($scope,$http) ->
    firstWatch = true

    input = (document.getElementById("pac-input"))
    searchBox = new google.maps.places.SearchBox((input))

    $scope.linea = [[]]

    $scope.destinations = []


    getDestinations = ->
      $http.get("/api/t/"+$scope.trip.id+"/dest/").success (data) ->
        $scope.destinations = data
        createPolyline()
        return
      return


    getDestinations()

    $scope.$watch "destinations", (->
      if !firstWatch
        createPolyline()
        centerMap()
        info = {
          dests: $scope.destinations
        }
        $http.post("/api/t/"+$scope.trip.id+"/dest", info).success (data) ->
          return

      return
    ), true


    createPolyline = () ->
      auxRoute = [[]]
      angular.forEach $scope.destinations, (index) ->
        auxRoute.push index.coordinates.split ","
        return
      $scope.linea = auxRoute
      $scope.$apply()
      return

    centerMap = () ->
      bounds = new google.maps.LatLngBounds()
      angular.forEach $scope.destinations, (index) ->
        coords = index.coordinates.split ","
        myLatLng = new google.maps.LatLng(coords[0], coords[1])
        bounds.extend myLatLng
      $scope.map.fitBounds bounds
      return

    addMarker = (mark) ->
      firstWatch = false
      $scope.destinations.push mark
      $scope.$apply()
      $("#pac-input").val('')
      $("#pac-input").focus()
      return

    $scope.removeDest = (i) ->
      firstWatch = false
      $scope.destinations.splice(i,1)
      return

    $scope.sortableOptions =
      update: (e, ui) ->
        ui.item.sortable.cancel()  if ui.item.scope().item is "can't be moved"
        return

    $scope.$on "mapInitialized", (event, map) ->
      map.setCenter(new google.maps.LatLng(0, 0))

      map.mapTypeId = google.maps.MapTypeId.ROADMAP
      map.setOptions (
        zoom: 2
        styles: [
              {
                featureType: "water"
                elementType: "geometry"
                stylers: [
                  {
                    visibility: "on"
                  }
                  {
                    color: "#aee2e0"
                  }
                ]
              }
              {
                featureType: "landscape"
                elementType: "geometry.fill"
                stylers: [color: "#abce83"]
              }
              {
                featureType: "poi"
                elementType: "geometry.fill"
                stylers: [color: "#769E72"]
              }
              {
                featureType: "poi"
                elementType: "labels.text.fill"
                stylers: [color: "#7B8758"]
              }
              {
                featureType: "poi"
                elementType: "labels.text.stroke"
                stylers: [color: "#EBF4A4"]
              }
              {
                featureType: "poi.park"
                elementType: "geometry"
                stylers: [
                  {
                    visibility: "simplified"
                  }
                  {
                    color: "#8dab68"
                  }
                ]
              }
              {
                featureType: "road"
                elementType: "geometry.fill"
                stylers: [visibility: "simplified"]
              }
              {
                featureType: "road"
                elementType: "labels.text.fill"
                stylers: [color: "#5B5B3F"]
              }
              {
                featureType: "road"
                elementType: "labels.text.stroke"
                stylers: [color: "#ABCE83"]
              }
              {
                featureType: "road"
                elementType: "labels.icon"
                stylers: [visibility: "off"]
              }
              {
                featureType: "road.local"
                elementType: "geometry"
                stylers: [color: "#A4C67D"]
              }
              {
                featureType: "road.arterial"
                elementType: "geometry"
                stylers: [color: "#9BBF72"]
              }
              {
                featureType: "road.highway"
                elementType: "geometry"
                stylers: [color: "#EBF4A4"]
              }
              {
                featureType: "transit"
                stylers: [visibility: "off"]
              }
              {
                featureType: "administrative"
                elementType: "geometry.stroke"
                stylers: [
                  {
                    visibility: "on"
                  }
                  {
                    color: "#87ae79"
                  }
                ]
              }
              {
                featureType: "administrative"
                elementType: "geometry.fill"
                stylers: [
                  {
                    color: "#7f2200"
                  }
                  {
                    visibility: "off"
                  }
                ]
              }
              {
                featureType: "administrative"
                elementType: "labels.text.stroke"
                stylers: [
                  {
                    color: "#ffffff"
                  }
                  {
                    visibility: "on"
                  }
                  {
                    weight: 4.1
                  }
                ]
              }
              {
                featureType: "administrative"
                elementType: "labels.text.fill"
                stylers: [color: "#495421"]
              }
              {
                featureType: "administrative.neighborhood"
                elementType: "labels"
                stylers: [visibility: "off"]
              }
        ]
        mapTypeId: google.maps.MapTypeId.ROADMAP
        scrollwheel: false
        navigationControl: false
        mapTypeControl: false
        scaleControl: false
        draggable: false
      )
      $scope.map = map
      setTimeout (->
        centerMap()
        return
      ), 1000

      return

    google.maps.event.addListener searchBox, "places_changed", ->
      places = searchBox.getPlaces()
      return  if places.length is 0
      i = 0
      marker = undefined


      # bounds = new google.maps.LatLngBounds()
      i = 0
      place = undefined

      while place = places[i]
        image =
          url: place.icon
          size: new google.maps.Size(71, 71)
          origin: new google.maps.Point(0, 0)
          anchor: new google.maps.Point(17, 34)
          scaledSize: new google.maps.Size(25, 25)


        # Create a marker for each place.
        marker = {
          name: place.name
          coordinates: place.geometry.location.k+","+place.geometry.location.B
        }
        addMarker marker
        # bounds.extend place.geometry.location
        i++
      # $scope.map.fitBounds bounds
      return
    return

app.controller "budgetCtrl",
  ($scope, $http) ->


    $scope.categories = [
      {name: I18n.t('transport'), color:'danger',id: 1},
      {name: I18n.t('food'), color:'success', id: 2},
      {name: I18n.t('sleep'), color:'primary', id: 3},
      {name: I18n.t('others'), color:'warning', id: 4}
    ]
    transport = {}
    food = {}
    sleep = {}
    others = {}

    isTransport = (element) ->
      return element.category == 1

    isFood = (element) ->
      return element.category == 2

    isSleep = (element) ->
      return element.category == 3

    isOthers = (element) ->
      return element.category == 4

    getTotalCategory = (categories) ->
      total = 0
      for cat in categories
        total+=(cat.priceperunit*cat.units)
      return total


    $scope.budgets = {}


    getBudgets = ->
      $http.get("/api/t/"+$scope.trip.id+"/budgets/").success (data) ->
        $scope.budgets = data
        console.log data
        return

      return


    getBudgets()


    $scope.addBudget = (item)->

      budget = {
        description: item.description
        category: item.category
        units: item.units
        priceperunit: item.priceperunit
      }


      $http.post("/api/t/"+$scope.trip.id+"/budgets/", budget).success (data) ->
        getBudgets()
        $scope.newbudget = []
        $scope.newbudget.priceperunit = 0
        $scope.newbudget.units = 0
        return

      return

    $scope.removeBudget = (item) ->
      $http.delete("/api/t/"+$scope.trip.id+"/budgets/", {params: {item: item.id}}).success (data) ->
        index = $scope.budgets.indexOf(item)
        $scope.budgets.splice(index, 1)
        return
      return

    $scope.modBudget = (item) ->
      $scope.toggleEditMode(item)
      modbudget = {
        description: item.description
        category: item.category
        units: item.units
        priceperunit: item.priceperunit
      }
      $http.post("/api/t/"+$scope.trip.id+"/budgets/"+item.id, modbudget).success (data) ->

        return
      return

    $scope.toggleEditMode = (budget)->
      if budget.editing is true
        budget.editing = false
      else
        budget.editing = true

      return
    $scope.highchartsNgConfig =
      options:
        chart:
          type: "pie"
        tooltip:
          style:
            padding: 10
            fontWeight: "bold"
      series: []

      #Title configuration (optional)
      title:
        text: I18n.t("budget_distribution")

      #Boolean to control showng loading status on chart (optional)
      loading: false

      #Configuration for the xAxis (optional). Currently only one x axis can be dynamically controlled.
      #properties currentMin and currentMax provied 2-way binding to the chart's maximimum and minimum
      xAxis:
        currentMin: 0
        currentMax: 20
        title:
          text: "values"

      #Whether to use HighStocks instead of HighCharts (optional). Defaults to false.
      useHighStocks: false

      func: (chart) ->
        #setup some logic for the chart
        # console.log chart
        return




    $scope.$watch "budgets", (->

      if $scope.budgets.length > 0
        transport = $scope.budgets.filter(isTransport)
        food = $scope.budgets.filter(isFood)
        sleep = $scope.budgets.filter(isSleep)
        others = $scope.budgets.filter(isOthers)

        aux = []
        aux.push({name: I18n.t("transport"),y: getTotalCategory(transport),color: "#d9534f"})
        aux.push({name: I18n.t("food"),y: getTotalCategory(food),color: "#5cb85c"})
        aux.push({name: I18n.t("sleep"),y: getTotalCategory(sleep),color: "#428bca"})
        aux.push({name: I18n.t("others"),y: getTotalCategory(others),color: "#f0ad4e"})
        $scope.highchartsNgConfig.series = []
        $scope.highchartsNgConfig.series.push name: "€", data: aux

      getTotal = 0
      for item in $scope.budgets
        getTotal += (item.priceperunit * item.units)

      $scope.getTotal = getTotal

      return
    ), true


    return

app.controller "stuffsCtrl",
  ($scope,$http) ->

    $scope.stuffs = []
    $scope.markAll = false


    getStuffs = ->
      $http.get("/api/t/"+$scope.trip.id+"/items/stuffs").success (data) ->
        $scope.stuffs = data
        return

      return


    getStuffs()

    statusAll = ->
      if ($scope.stuffs.length - $scope.remaining()) is $scope.stuffs.length
        $scope.markAll = true
      else
        $scope.markAll = false
      return
      return

    $scope.$watch "stuffs", ->
      statusAll()
      return

    $scope.addStuff = ->
      if event.keyCode is 13 and $scope.stuffText
        data = {
          description: $scope.stuffText
        }
        $http.post("/api/t/"+$scope.trip.id+"/items/stuff/", data).success (data) ->
          getStuffs()
          $scope.stuffText = ""
          return

      return

    modStuff = (todo) ->
      $scope.toggleEditMode(todo)
      $http.post("/api/t/"+$scope.trip.id+"/items/stuff/", todo).success (data) ->
        getStuffs()
        return
      return
    $scope.isStuff = ->
      $scope.stuffs.length > 0

    $scope.toggleEditMode = (todo)->
      if todo.editing is true
        todo.editing = false
      else
        todo.editing = true

      return

    $scope.editOnEnter = (todo) ->

      modStuff(todo)  if (event.keyCode is 13 or event.type is "click") and todo.description
      return

    $scope.changeStatus = (todo) ->
      $http.post("/api/t/"+$scope.trip.id+"/items/stuff/", todo).success (data) ->
        return
      statusAll()
      return

    $scope.remaining = ->
      count = 0
      angular.forEach $scope.stuffs, (todo) ->
        count += (if todo.status then 0 else 1)
        return

      count

    $scope.hasDone = ->
      $scope.stuffs.length isnt $scope.remaining()

    $scope.itemText = ->
      (if ($scope.stuffs.length - $scope.remaining() == 1) then I18n.t("leftstuff") else I18n.t("leftstuffs"))

    $scope.toggleMarkAll = ->
      if $scope.remaining() is 0
        all = true
      else
        all = false
      angular.forEach $scope.stuffs, (todo) ->
        if all
          todo.status = false
        else
          todo.status = true
        $scope.changeStatus(todo)
        return
      return

    $scope.removeItem = (todo) ->
      $http.delete("/api/t/"+$scope.trip.id+"/items/stuff/", {params: {item: todo.id}}).success (data) ->
        index = $scope.stuffs.indexOf(todo)
        $scope.stuffs.splice(index, 1)
        return
      return
    $scope.clear = ->

      angular.forEach $scope.stuffs, (todo) ->
        $scope.removeItem(todo) if todo.status

        return
      getStuffs()


      return

    return

app.controller "tasksCtrl",
  ($scope, $http) ->

    $scope.tasks = []
    $scope.markAll = false


    getTasks = ->
      $http.get("/api/t/"+$scope.trip.id+"/items/tasks").success (data) ->
        $scope.tasks = data
        return

      return


    getTasks()

    statusAll = ->
      if ($scope.tasks.length - $scope.remaining()) is $scope.tasks.length
        $scope.markAll = true
      else
        $scope.markAll = false
      return
      return

    $scope.$watch "tasks", ->
      statusAll()
      return

    $scope.addTask = ->
      if event.keyCode is 13 and $scope.taskText
        data = {
          description: $scope.taskText
        }
        $http.post("/api/t/"+$scope.trip.id+"/items/task/", data).success (data) ->
          getTasks()
          $scope.taskText = ""
          return

      return

    modTask = (todo) ->
      $scope.toggleEditMode(todo)
      $http.post("/api/t/"+$scope.trip.id+"/items/task/", todo).success (data) ->
        getTasks()
        return
      return

    $scope.isTask = ->
      $scope.tasks.length > 0

    $scope.toggleEditMode = (todo)->
      if todo.editing is true
        todo.editing = false
      else
        todo.editing = true

      return

    $scope.editOnEnter = (todo) ->
      modTask(todo) if (event.keyCode is 13 or event.type is "click") and todo.description
      return

    $scope.changeStatus = (todo) ->
      $http.post("/api/t/"+$scope.trip.id+"/items/task/", todo).success (data) ->
        return
      statusAll()
      return

    $scope.remaining = ->
      count = 0
      angular.forEach $scope.tasks, (todo) ->
        count += (if todo.status then 0 else 1)
        return

      count

    $scope.hasDone = ->
      $scope.tasks.length isnt $scope.remaining()

    $scope.itemText = ->
      (if ($scope.tasks.length - $scope.remaining() == 1) then I18n.t("lefttask") else I18n.t("lefttasks"))

    $scope.toggleMarkAll = ->
      if $scope.remaining() is 0
        all = true
      else
        all = false
      angular.forEach $scope.tasks, (todo) ->
        if all
          todo.status = false
        else
          todo.status = true
        $scope.changeStatus(todo)
        return
      return

    $scope.removeItem = (todo) ->
      $http.delete("/api/t/"+$scope.trip.id+"/items/task/", {params: {item: todo.id}}).success (data) ->
        index = $scope.tasks.indexOf(todo)
        $scope.tasks.splice(index, 1)
        return
      return

    $scope.clear = ->

      angular.forEach $scope.tasks, (todo) ->
        $scope.removeItem(todo) if todo.status
        return
      getTasks()


      return

    return



window.onload = loadScript
