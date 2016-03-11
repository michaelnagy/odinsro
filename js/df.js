//--------------------------------------------------------------------------
    //  DreamFactory 2.0 instance specific constants
    //--------------------------------------------------------------------------

    var INSTANCE_URL   = 'http://149.56.47.245';
    var APP_API_KEY     = '6b683ef66c7a94ab810afe01df1faacfffd45bb05d86676feaf79b7cf94ba553';

  //   Process Event Scripts  user  user.password  [POST] user.password  user.password.post.post_process
	 //    var userbd = {
		//   "email": "michaelnt8@hotmail.com",
		//   "password": "179i9987",
		//   "duration": 0
		// };



		// var_dump(event.request.parameters.reset);

	 //    if(event.request.payload.new_password){
	       
	 //    var result = platform.api.patch("odinsro/_table/login?filter=email%20like%20"+event.request.payload.email+"", {"resource": [{"user_pass":event.request.payload.new_password}]});
	 //        var_dump(result);
	            
	 //    }


// Process Event Scripts  user  user.register  [POST] user.register  user.register.post.pre_process


// var result = platform.api.get("odinsro/_table/login?filter=userid%20like%20"+event.request.payload.display_name+"");

// if(result.content.resource[0]) {
//         throw 'This username is already taken';
//     }    


// Process Event Scripts  user  user.register  [POST] user.register  user.register.post.post_process

// var userbd = {};
        
//         userbd.email = event.request.payload.email;
//         userbd.user_pass = event.request.payload.new_password;
//         userbd.userid = event.request.payload.display_name;
//         //POST to odinsro database
//         var result = platform.api.post("odinsro/_table/login", {"resource": [userbd]});
//         event.response.content.odinid = result.content.resource[0].account_id;
//         event.response.content.email = event.request.payload.email;
//         event.response.content.name = event.request.payload.display_name;
//         event.response.content_changed = true;



// Process Event Scripts  user  user.register  [POST] user.register  user.register.post.post_process
// var userbd = {};
        
//         userbd.email = event.request.payload.email;
//         userbd.user_pass = event.request.payload.new_password;
//         userbd.userid = event.request.payload.display_name;
//         //POST to odinsro database
//         var result = platform.api.post("odinsro/_table/login", {"resource": [userbd]});
//         event.response.content.odinid = result.content.resource[0].account_id;
//         event.response.content.email = event.request.payload.email;
//         event.response.content.name = event.request.payload.display_name;
//         event.response.content_changed = true;