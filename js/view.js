/*jslint indent: 2 */
/*jslint browser: true*/
/*global riot*/

(function (w, riot) {
  "use strict";

  var view = {},
    groups = {},
    createGroupIfNotExist;

  createGroupIfNotExist = function (groupName) {
    if (!groups[groupName]) {
      groups[groupName] = {
        unmountListeners: {}
      };
    }
  };

  view.getGroups = function () {
    return groups;
  };

  view.unmount = function (name, groupName) {
    groupName = groupName || "default";
    var func = groups[groupName].unmountListeners[name];
    func();
  };

  view.addUnmountListener = function (name, func, groupName) {
    groupName = groupName || "default";
    createGroupIfNotExist(groupName);

    //view.unmountListeners[name] = func;
    groups[groupName].unmountListeners[name] = func;
  };

  view.render = function (name, groupName) {
    groupName = groupName || "default";
    createGroupIfNotExist(groupName);

    // unmount previous selected
    if (groups[groupName].selected) {
      view.unmount(groups[groupName].selected, groupName);
    }

    // mount
    riot.mount(name);

    groups[groupName].selected = name;
  };

  w.view = view;
}(window, riot));