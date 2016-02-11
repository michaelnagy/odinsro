

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
                    cache:false,
                    method:'POST',
                    success: function (response) {

                        if(response.hasOwnProperty('session_token')) {

                          Materialize.toast('<span>Você agora está logado</span>', 8000);
                          setToken('token', response.session_token);
                          setToken('email', response.email);
                          //changes URL in browser
                          riot.route('perfil');
                          //update riotjs tags
                          riot.update();
                          //closes the login modal
                          $('#modal1.modal').closeModal();
                        }
                        console.log(response);
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
                    success:function (response) {
                        Materialize.toast('<span>Você foi deslogado</span>', 8000);
                        sessionStorage.clear();
                        $('.login-form')[0].reset();
                        riot.update();
                        console.log(getToken('token'));
                    },
                    error:function (response) {
                        console.log(response);
                        return false;
                    }
                });
            },

            register: function(email, password, callback) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/user/register?login=true',
                    data: JSON.stringify({
                        // "first_name": firstname,
                        // "last_name": lastname,
                        "email": email,
                        "new_password": password
                    }),
                    cache:false,
                    method:'POST',
                    success:function (response) {
                      if(response.hasOwnProperty('session_token')) {
                          setToken('token', response.session_token);
                          console.log(response);
                      }

                    },
                    error:function (response) {

                      var msgObj = {};
                      msgObj = parseResponse(response);
                      if(msgObj) {

                          //
                          messageBox(msgObj.code, msgObj.message, msgObj.error);
                      }

                    }
                });
            },

            getRecords: function(table, params, token, callback) {
                $.ajax({
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: INSTANCE_URL + '/api/v2/db/_table/' + table,
                    data: params,
                    cache:false,
                    method:'GET',
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
