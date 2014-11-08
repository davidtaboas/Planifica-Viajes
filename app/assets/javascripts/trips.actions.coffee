window.loadScript = ->
  $window = $(window)
  $("section[data-type=\"background\"]").each ->

    # declare the variable to affect the defined data-type
    $scroll = $(this)
    $(window).scroll ->

      # HTML5 proves useful for helping with creating JS functions!
      # also, negative value because we're scrolling upwards
      yPos = -($window.scrollTop() / $scroll.data("speed"))

      # background position
      coords = "50% " + yPos + "px"

      # move the background
      $scroll.css backgroundPosition: coords
      return

    return

  editorTitle = new MediumEditor("h1.editable",
    disableToolbar: true
  )
  editorDescription = new MediumEditor(".content.editable",
  )

  $("h1.editable").focus ->
    $(".save-title").animate
      opacity: 1
    , 500
    return

  firstTitle = $("h1.editable").text()
  $("h1.editable").focusout ->
    if firstTitle is $(this).text()
      $(".save-title").animate
        opacity: 0
      , 500
    return

  $(".content.editable").focus ->
    $(".save-description").animate
      opacity: 1
    , 500
    return
  firstDescription = $(".content.editable").html()
  $(".content.editable").focusout ->
    if firstDescription is $(this).html()
      $(".save-description").animate
        opacity: 0
      , 500
    return

  $(".visibility").on "click", () ->
    $("#sharedpreferences").css
      right: $("body").width() - $("button.visibility").offset().left + 10
    $("#sharedpreferences").toggle()
    return

  $('.change-image').on "click", () ->
    $(".uploader").fadeIn()
    return
  $(".uploader .cancel").on "click", () ->
    $(".uploader").fadeOut()
    return

  $(".show-panel").on "click", () ->
    $(".panel").fadeToggle "fast", ->
        $(".show-panel").css "display", "none"
        $(".hide-panel").css "display", "block"
      return

    return

  $(".hide-panel").on "click", () ->
    $(".panel").fadeToggle "fast", ->
        $(".hide-panel").css "display", "none"
        $(".show-panel").css "display", "block"
      return
    return


  return
