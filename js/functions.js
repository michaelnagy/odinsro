

(function($) {

    $.extend({

        api: {
            login: function(email, password) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/user/session',
                    data: JSON.stringify({
                        "email": email,
                        "password": password
                    }),
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY
                    },
                    cache:false,
                    method:'POST',
                    success: function (response) {

                        if(response.hasOwnProperty('session_token')) {

                          Materialize.toast('<span>You are now logged in your account</span>', 8000);
                          setToken('token', response.session_token);
                          setToken('email', response.email);
                          setToken('odinid', response.odinid);
                          setToken('birthdate', response.birthdate);
                          setToken('name', response.name);
                          setToken('last', response.last_login_date);
                          console.log(response);
                          //closes the login modal
                          $('#modal1.modal').closeModal();
                          //changes URL in browser
                          riot.update();
                          riot.route('profile');
                        }
                        // console.log(response);
                    },
                    error: function (response) {
                        var msgObj = {};
                        msgObj = parseResponse(response);
                        if(msgObj) {
                            // console.log(msgObj.code, msgObj.message, msgObj.error);
                            Materialize.toast('<span>'+msgObj.message+'</span>', 8000);
                            // Materialize.toast('<span>'+response.responseJSON.error.message+'</span>', 8000);
                            // console.log(response.responseJSON.error.message);
                        }



                        return false;

                    }
                });
            },

            logout: function() {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/user/session',
                    cache:false,
                    method:'DELETE',
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY
                    },
                    success:function (response) {
                        Materialize.toast('<span>You have been disconnected from the system</span>', 8000);
                        sessionStorage.clear();
                        riot.update();
                    },
                    error:function (response) {
                        Materialize.toast('<span><b>Error!</b><br>Please try to logout again.</span>', 5000);
                    
                        return false;
                    }
                });
            },

            reset: function(email) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/user/password?reset=true',
                    cache:false,
                    method:'POST',
                    data: JSON.stringify({
                        "email": email,
                    }),
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY
                    },
                    success:function (response) {
                        Materialize.toast('<span>A <b>confirmation code</b> was sent to your e-mail.<br>Insert it in the field below and set your <b>new password.</b></span>', 20000);
                        $('.reset2, .btn-reset2').fadeIn('slow');
                        $('.btn-reset').hide();
                        console.log(response);
                    },
                    error:function (response) {
                        console.log(response);

                        var msgObj = {};
                        msgObj = parseResponse(response);
                        if(msgObj) {
                            // console.log(msgObj.code, msgObj.message, msgObj.error);
                            Materialize.toast('<span>'+msgObj.message+'</span>', 8000);
                          }

                        return false;
                    }
                });
            },
            reset2: function(email, code, new_password) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/user/password',
                    cache:false,
                    method:'POST',
                    data: JSON.stringify({
                        "email": email,
                        "code": code,
                        "new_password": new_password
                    }),
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY
                    },
                    success:function (response) {
                        Materialize.toast('<span><b>Sucess!</b> Your password was sucessfully changed.<br>You can now press Go Back and login.</span>', 8000);
                    },
                    error:function (response) {
                        console.log(response);

                        var msgObj = {};
                        msgObj = parseResponse(response);
                        if(msgObj) {
                            // console.log(msgObj.code, msgObj.message, msgObj.error);
                            Materialize.toast('<span>'+msgObj.message+'</span>', 8000);
                          }
                        dataform = [];

                        return false;
                    }
                });
            },

            register: function(display_name, email, password, recaptcha) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/user/register?login=true',
                    data: JSON.stringify({
                        // "first_name": firstname,
                        "display_name": display_name,
                        "email": email,
                        "new_password": password,
                        "recaptcha": recaptcha
                    }),
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY
                    },
                    cache:false,
                    method:'POST',
                    success:function (response) {
                      if(response.hasOwnProperty('session_token')) {
                          // console.log(response, email);
                            Materialize.toast('<span><b>Account created!</b><br>You are now logged in to your account</span>', 8000);
                            setToken('token', response.session_token);
                            setToken('email', email);
                            setToken('odinid', response.odinid);
                            setToken('birthdate', response.birthdate);
                            setToken('name', display_name);
                            console.log(response);

                            //update riotjs tags
                            riot.update();
                            //changes URL in browser
                            riot.route('/profile');

                            //closes the login modal
                            $('#modal2.modal').closeModal();

                      }

                    },
                    error:function (response) {

                      var msgObj = {};
                      msgObj = parseResponse(response);
                      if(msgObj) {
                        Materialize.toast('<span>'+msgObj.message+'</span>', 8000);
                      }

                    }
                });
            },

            getRecords: function(table, token, tag) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/odinsro/_table/' + table,
                    cache:false,
                    method:'GET',
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY,
                        "X-DreamFactory-Session-Token": token
                    },
                    success:function (response) {

                        if (response.resource[0].zeny != undefined) {
                            setToken('zeny', response.resource[0].zeny);
                            // console.log(response.resource[0].zeny); 
                        }
                        
                        if (response.resource[0].autotrade) {
                            storage.set({
                              autotrade: response.resource
                              console.log(response.resource);
                            });
                        }
                        if (response.resource[0].value) {
                            setToken('cash', response.resource[0].value);
                        }
                        if (response.resource[0].kills) {
                            storage.set({
                              pvp: response.resource
                            });
                            // console.log(response.resource);
                        }
                        if (response.resource[0].castle_id) {
                            storage.set({
                              woe: response.resource
                            });
                            // console.log(response.resource);
                        }
                        riot.update();
                    },
                    error:function (response) {
                        
                        // console.log(response.responseJSON.error.message);
                        if (response.responseJSON.error.message == 'Token has expired') {
                        Materialize.toast('<span>Session expired. Please log in again</span>', 8000);
                        $.api.logout();
                        riot.route('/');
                        }
                    }
                });
            },
            // getRecords: function(table, params, token) {
            //     $.ajax({
            //         dataType: 'json',
            //         contentType: 'application/json; charset=utf-8',
            //         url: INSTANCE_URL + '/api/v2/odinsro/_table/' + table +'?id_field=account_id&ids='+2004003,
            //         cache:false,
            //         data: params,
            //         method:'GET',
            //         headers: {
            //             "X-DreamFactory-API-Key": APP_API_KEY,
            //             "X-DreamFactory-Session-Token": token
            //         },
            //         success:function (response) {
            //             if(typeof callback !== 'undefined') {
            //                 if (response.hasOwnProperty('resource'))
            //                     callback(response.resource);
            //                 else
            //                     callback(response);
            //             }
            //         },
            //         error:function (response) {
            //             callback(response);
            //             return false;
            //         }
            //     });
            // },

            setRecord: function(table, params, token, callback) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/db/_table/' + table,
                    data: params,
                    cache:false,
                    method:'POST',
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY,
                        "X-DreamFactory-Session-Token": token
                    },
                    success:function (response) {
                        if(typeof callback !== 'undefined') {
                            if (response.hasOwnProperty('resource'))
                                callback(response.resource);
                            else
                                callback(response);
                        }
                    },
                    error:function (response) {
                        callback(response);
                        return false;
                    }
                });
            },

            updateRecord: function(table, params, token, callback) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/db/_table/' + table,
                    data: params,
                    cache:false,
                    method:'PATCH',
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY,
                        "X-DreamFactory-Session-Token": token
                    },
                    success:function (response) {
                        if(typeof callback !== 'undefined') {
                            if (response.hasOwnProperty('resource'))
                                callback(response.resource);
                            else
                                callback(response);
                        }
                    },
                    error:function (response) {
                        callback(response);
                        return false;
                    }
                });
            },

            deleteRecord: function(table, params, token, callback) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/db/_table/' + table + '?' + params,
                    //data: params,
                    cache:false,
                    method:'DELETE',
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY,
                        "X-DreamFactory-Session-Token": token
                    },
                    success:function (response) {
                        if(typeof callback !== 'undefined') {
                            if (response.hasOwnProperty('resource'))
                                callback(response.resource);
                            else
                                callback(response);
                        }
                    },
                    error:function (response) {
                        callback(response);
                        return false;
                    }
                });
            },

            replaceRecord: function(table, params, token, callback) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/db/_table/' + table,
                    data: params,
                    cache: false,
                    method: 'PUT',
                    headers: {
                        "X-DreamFactory-API-Key": APP_API_KEY,
                        "X-DreamFactory-Session-Token": token
                    },
                    success: function (response) {
                        if(typeof callback !== 'undefined') {
                            if (response.hasOwnProperty('resource'))
                                callback(response.resource);
                            else
                                callback(response);
                        }
                    },
                    error: function (response) {
                        callback(response);
                        return false;
                    }
                });
            }
        }
    });

}(jQuery));
