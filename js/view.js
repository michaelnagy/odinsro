/*jslint indent: 2 */
/*jslint browser: true*/
/*global riot*/

(function (w, riot) {
  "use strict";

  var view = {};

  view.unmountListeners = {};

  view.unmount = function (name) {
    var func = view.unmountListeners[name];
    func();
  };

  view.addUnmountListener = function (name, func) {
    view.unmountListeners[name] = func;
  };

  view.render = function (name) {
    // unmount
    if (view.selected) {
      view.unmount(view.selected);
    }

    // mount
    riot.mount(name);

    view.selected = name;
  };

  w.view = view;
}(window, riot));