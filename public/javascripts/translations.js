var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match %{attribute}","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","present":"must be blank","too_long":"is too long (maximum is %{count} characters)","too_short":"is too short (minimum is %{count} characters)","wrong_length":"is the wrong length (should be %{count} characters)","not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","other_than":"must be other than %{count}","odd":"must be odd","even":"must be even","taken":"has already been taken","carrierwave_processing_error":"failed to be processed","carrierwave_integrity_error":"is not of an allowed file type","carrierwave_download_error":"could not be downloaded","extension_white_list_error":"You are not allowed to upload %{extension} files, allowed types: %{allowed_types}","extension_black_list_error":"You are not allowed to upload %{extension} files, prohibited types: %{prohibited_types}","rmagick_processing_error":"Failed to manipulate with rmagick, maybe it is not an image? Original Error: %{e}","mime_types_processing_error":"Failed to process file with MIME::Types, maybe not valid content-type? Original Error: %{e}","mini_magick_processing_error":"Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: %{e}","already_confirmed":"was already confirmed, please try signing in","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","expired":"has expired, please request a new one","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"}}},"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"}},"flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"update":{"notice":"%{resource_name} was successfully updated."},"destroy":{"notice":"%{resource_name} was successfully destroyed.","alert":"%{resource_name} could not be destroyed."}}},"devise":{"confirmations":{"confirmed":"Your email address has been successfully confirmed.","send_instructions":"You will receive an email with instructions for how to confirm your email address in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid %{authentication_keys} or password.","locked":"Your account is locked.","last_attempt":"You have one more attempt before your account is locked.","not_found_in_database":"Invalid %{authentication_keys} or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your email address before continuing."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \"%{reason}\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions on how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password has been changed successfully. You are now signed in.","updated_not_active":"Your password has been changed successfully."},"registrations":{"destroyed":"Bye! Your account has been successfully cancelled. We hope to see you again soon.","signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirm link to confirm your new email address.","updated":"Your account has been updated successfully."},"sessions":{"signed_in":"Signed in successfully.","signed_out":"Signed out successfully.","already_signed_out":"Signed out successfully."},"unlocks":{"send_instructions":"You will receive an email with instructions for how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions for how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}},"Title":"Planning","sign_in":"Sign in","log_out":"Logout","signed_as":"Signed as","Description":"Description","Budget":"Budget","BudgetElements":"Budget Elements","Stuffs":"Stuffs","ToDo":"Task List","Item":"Item","Units":"Units","PriceUnit":"Price/Unit","Cost":"Cost","transport":"Transport","food":"Food","sleep":"Sleep","others":"Others","budget_distribution":"Budget Distribution"},"es":{"seo":{"title":"Planifica Viajes","description":"Planifica viajes desde el principio, con tu ruta, presupuesto, inventario y tareas.","keywords":"planifica viajes, preparar viaje, borrador viaje"},"web":{"copyright":"Una aplicación realizada por David Táboas"},"auth":{"sign_in":"Entrar","log_out":"Salir","username":"Usuario","password":"Contraseña","register":"¿Quieres registrarte?","charactersminimum":"caracteres como mínimo","login":"Identificarse","signup":"Registrarte","forgotyourpassword?":"¿Olvidaste tu contraseña?","didn'treceiveconfirmationinstructions?":null,"didn'treceiveunlockinstructions?":null,"current_password":"Contraseña actual","password_confirmation":"Repetir contraseña","leave_blank":"(dejar en blanco si no se quiere cambiar)","need_your_current_password":"(Necesitamos tu contraseña actual para confirmar los cambios)","uditAccount":"Editar cuenta","errorOnLogin":"eMail y/o contraseña incorrecta/s","editAccount":"Editar cuenta","remember_me":"Recuérdame"},"user":{"allYourTrips":"Tus viajes","yourAccount":"Tu cuenta","latest":"Últimos","favorites":"Favoritos","editables":"Editables","actions":"Acciones","deleteAccount":"Eliminar cuenta","newTrip":"Nuevo viaje","accountDeleted":"Cuenta eliminada","removeAccount":"Eliminar tu cuenta"},"trip":{"tempTitle":"Viaje","tempDescription":"\u003cp\u003eEscribe una bonita descripción...\u003c/p\u003e","description":"Descripción","budget":"Presupuesto","budgetElements":"Elementos Presupuestados","stuffs":"Inventario","toDo":"Tareas","item":"Item","units":"Unidades","priceUnit":"Precio/Unidad","cost":"Coste","transport":"Transporte","food":"Manutención","sleep":"Alojamiento","others":"Otros","budget_distribution":"Distribución de presupuesto","dragImageHere":"Arrastra una imagen hasta aquí","deleteTrip":"Eliminar viaje","manageUsers":"Gestionar Usuarios","sharedPreferences":"Privacidad","deleteTripTitle":"Eliminar viaje","private":"Privado","shared":"Compartido","public":"Público","startDate":"Inicio","endDate":"Fin","clearCompleted":"Eliminar completadas","leftstuff":"inventario restante","leftstuffs":"inventario restantes","lefttasks":"tareas restantes","lefttask":"tarea restante","whatTask":"¿Qué tarea debes realizar?","whatStuff":"¿Qué material necesitas?","share":"Compartir:","userManagement":"Gestión de usuarios"},"general":{"accept":"Aceptar","cancel":"Cancelar","save":"Guardar","add":"Añadir","close":"Cerrar","update":"Actualizar","yesSure":"Sí, estoy seguro.","noTurningBack":"No hay vuelta atrás.","sure":"¿Estás seguro?"},"exception":{"accessdenied":"No tienes permisos para ver este viaje."},"time":{"formats":{"trip":"%d/%m/%Y"}},"devise":{"confirmations":{"confirmed":"Su cuenta ha sido confirmada.","confirmed_and_signed_in":"Su cuenta ha sido confirmada. Ha sido identificado correctamente.","send_instructions":"Recibira un correo electrónico en unos minutos con instrucciones sobre cómo restablecer su contraseña.","send_paranoid_instructions":"Si su correo electrónico existe en nuestra base de datos recibirás un correo electrónico en unos minutos con instrucciones sobre cómo reiniciar su contraseña."},"failure":{"already_authenticated":"Te has identificado.","inactive":"su cuenta aún no ha sido activada.","invalid":"Correo o contraseña inválidos.","invalid_token":"Cadena de autenticación invalida.","locked":"Su cuenta ha sido bloqueada.","not_found_in_database":"Correo o contraseña inválidos.","timeout":"su sesión ha expirado, por favor identifíquese de nuevo para continuar.","unauthenticated":"Necesita iniciar sesión o registrarse para continuar.","unconfirmed":"Debe confirmar su cuenta para continuar.","last_attempt":"Tiene un intento más antes de que su cuenta sea bloqueada."},"mailer":{"confirmation_instructions":{"subject":"Instrucciones de confirmación"},"reset_password_instructions":{"subject":"Instrucciones para restablecer su contraseña"},"unlock_instructions":{"subject":"Instrucciones de desbloqueo"}},"omniauth_callbacks":{"failure":"No se le ha podido autorizar de %{kind} debido a \"%{reason}\".","success":"Identificado correctamente de %{kind}."},"passwords":{"no_token":"No puede acceder a esta página sino es por medio de un enlace para restablecer contraseña. Si ha accedido desde el enlace para restablecer la contraseña, asegúrese de que la URL estÃ© completa.","send_instructions":"Recibira un correo electrónico con instrucciones sobre cómo restablecer su contraseña en unos minutos.","send_paranoid_instructions":"Si su correo electrónico existe en nuestra base de datos, recibira un enlace para restablecer la contraseña en unos minutos.","updated":"Su contraseña ha cambiado correctamente. Ha sido identificado correctamente.","updated_not_active":"Su contraseña se ha cambiado correctamente."},"registrations":{"destroyed":"¡Adiós! Tu cuenta ha sido cancelada. Esperamos volver a verte pronto con más viajes.","signed_up":"¡Bienvenido! Te has identificado correctamente.","signed_up_but_inactive":"Se ha registrado correctamente, pero no ha podido iniciar sesión porque su cuenta no ha sido activada.","signed_up_but_locked":"Se ha registrado correctamente, pero no ha podido iniciar sesión porque su cuenta está bloqueada.","signed_up_but_unconfirmed":"Se le ha enviado un mensaje con un enlace de confirmación. Por favor visite el enlace para activar su cuenta.","update_needs_confirmation":"Ha actualizado su cuenta correctamente, sin embargo necesitamos verificar su nueva cuenta de correo. Por favor revise su correo electrónico y visite el enlace para finalizar la confirmación de su nueva dirección de correo electrónico.","updated":"Ha actualizado tu cuenta correctamente."},"sessions":{"signed_in":"Has iniciado sesión satisfactoriamente.","signed_out":"Has cerrado la sesión satisfactoriamente."},"unlocks":{"send_instructions":"Recibira un correo electrónico en unos minutos con instrucciones sobre cómo desbloquear su cuenta.","send_paranoid_instructions":"Si su cuenta existe, recibira un correo electrónico en unos minutos con instrucciones sobre cómo desbloquear su cuenta.","unlocked":"Su cuenta ha sido desbloqueada. Por favor inicie sesión para continuar."}},"errors":{"messages":{"already_confirmed":"ya ha sido confirmado, por favor intente iniciar sesión.","confirmation_period_expired":"necesita ser confirmado en %{period}, por favor vuelva a solicitarla.","expired":"ha expirado, por favor vuelva a solicitarla.","not_found":"no se ha encontró.","not_locked":"no estaba bloqueado.","not_saved":{"one":"1 error impidió que este %{resource} fuese guardado:","other":"%{count} errores impidieron que este %{resource} fuese guardado:"}}}}};