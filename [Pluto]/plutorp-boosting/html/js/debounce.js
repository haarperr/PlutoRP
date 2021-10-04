function ShowOnScroll() {
    this.toShow = [];
    this.nextEventY = undefined;
  }

  ShowOnScroll.prototype.show = function (e) {
    e.style.display = "";
  };

  ShowOnScroll.prototype.hide = function (e) {
    e.style.display = "none";
  };

  ShowOnScroll.prototype.getTop = function (e) {
    if (e.Top != undefined && e.Top != 0) {
      return e.Top;
    }
    var top = 0;
    var iter = e;
    do {
      top += iter.offsetTop || 0;
      iter = iter.offsetParent;
    } while (iter);
    e.Top = top;
    return top;
  };

  ShowOnScroll.prototype.onScroll = function () {
    var screenBottom = window.pageYOffset + window.innerHeight;
    if (this.nextEventY == undefined || this.nextEventY > screenBottom) {
      return;
    }
    this.nextEventY = undefined;
    for (var i = 0; i < this.toShow.length; i++) {
      var e = this.toShow[i];
      var top = this.getTop(e);
      if (top < screenBottom) {
        this.show(e);
        this.toShow.shift();
        i--;
      } else {
        this.nextEventY = top;
        break;
      }
    }
  };

  ShowOnScroll.prototype.resetScrolling = function () {
    // Clear state
    var screenBottom = window.pageYOffset + window.innerHeight;
    for (var i = 0; i < this.toShow.length; i++) {
      var e = this.toShow[i];
      this.show(e);
    }
    this.toShow = [];
    this.nextEventY == undefined;

    // Collect items
    var itemsToShowOnScroll = Array.prototype.slice.call(document.getElementsByTagName("*"));
    itemsToShowOnScroll = itemsToShowOnScroll.filter(function (e) {
      return e.getAttribute("show-on-scroll") != undefined;
    });
    var getTop = this.getTop;
    itemsToShowOnScroll.sort(function (a, b) {
      return getTop(a) - getTop(b);
    });
    for (var i = 0; i < itemsToShowOnScroll.length; i++) {
      var e = itemsToShowOnScroll[i];
      var top = this.getTop(e);
      if (top < screenBottom) {
        continue;
      }
      this.toShow.push(e);
      this.hide(e);
      this.nextEventY = this.nextEventY != undefined ? this.nextEventY : top;
    }
  };

  ShowOnScroll.prototype.handleEvent = function (e) {
    switch (e.type) {
      case "scroll":
        this.onScroll();
        break;
      case "resize":
        this.resetScrolling();
        break;
    }
  };

  ShowOnScroll.prototype.init = function () {
    this.resetScrolling();
    window.addEventListener("scroll", this);
    window.addEventListener("resize", this);
  };

  // After anima-src
setTimeout(function () {
    var instShowOnScroll = new ShowOnScroll();
    instShowOnScroll.init();
}, 250);