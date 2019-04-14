"use strict";

exports.getBoundingClientRect = function (node) {
  return function () {
    return node.getBoundingClientRect().top;
  };
};
