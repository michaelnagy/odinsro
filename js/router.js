/*jslint indent: 2 */
/*jslint browser: true*/

(function (w) {
  "use strict";

  var router = function (path, func) {
    var that = {},
      regex = /(\:\w+)/g,
      generateParams = function (params, regex, path) {
        var matches = regex.exec(path);
        if (matches) {
          params.push(matches[1].substring(1));
          generateParams(params, regex, path);
        }
      };

    that.path = path;
    that.func = func;
    that.regexPath = '^' + path.replace(/\//g, '\\/') //replace slashs
      .replace(/\:\w+/g, '(\\w+)') + '$'; //replace variables
    that.paramsKeys = [];

    generateParams(that.paramsKeys, regex, path);

    router.list.push(that);
  };

  router.list = [];

  router.events = [];

  router.match = function (hashRoute) {
    var routeObj, match;

    router.list.every(function (item) {
      match = new RegExp(item.regexPath).exec(hashRoute);

      // continue if not match
      if (!match) {
        return true;
      }

      var params = match.slice(1);
      item.params = {};

      params.forEach(function (value, index) {
        item.params[item.paramsKeys[index]] = value;
      });

      if (item.params.length === 0) {
        delete item.params;
      }

      routeObj = item;
      // stop "every" function
      return false;
    });

    if (routeObj) {
      routeObj.func.call(match, routeObj.params);
    }
  };

  w.addEventListener('hashchange', function (e) {
    var hashRoute = e.newURL.split('#')[1].replace('//', '/');

    router.match(hashRoute);
  });

  w.addEventListener('load', function () {
    // check routes
    var hashRoute = w.location.hash.replace('//', '/');

    hashRoute = (hashRoute.substring(0, 1) === '#')
      ? hashRoute.substring(1, hashRoute.length)
      : hashRoute;

    router.match(hashRoute);
  });

  w.router = router;
}(window));
