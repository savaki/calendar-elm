Elm.Native.Moment = {};
Elm.Native.Moment.make = function (localRuntime) {
  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.Moment = localRuntime.Native.Moment || {};
  if (localRuntime.Native.Moment.values) {
    return localRuntime.Native.Moment.values;
  }

  var Result = Elm.Result.make(localRuntime);

  function clone(d) {
    return new Date(d.getTime());
  }

  return localRuntime.Native.Moment.values = {
    unix: function (unix) {
      return new Date(unix)
    },
    toString: function (d) {
      return d.toString();
    },

    millisecond: function (d) {
      return d.getMilliseconds();
    },
    second: function (d) {
      return d.getSeconds();
    },
    minute: function (d) {
      return d.getMinutes();
    },
    hour: function (d) {
      return d.getHours();
    },
    dateOfMonth: function (d) {
      return d.getDate();
    },
    dayOfWeek: function (d) {
      return d.getDay();
    },
    month: function (d) {
      return d.getMonth();
    },
    year: function (d) {
      return d.getYear();
    },

    setMillisecond: function (tuple) {
      var d = clone(tuple._1);
      d.setMilliseconds(tuple._0);
      return d;
    },
    setSecond: function (tuple) {
      var d = clone(tuple._1);
      d.setSeconds(tuple._0);
      return d;
    },
    setMinute: function (tuple) {
      var d = clone(tuple._1);
      d.setMinutes(tuple._0);
      return d;
    },
    setHour: function (tuple) {
      var d = clone(tuple._1);
      d.setHours(tuple._0);
      return d;
    },
    setDateOfMonth: function (tuple) {
      var d = clone(tuple._1);
      d.setDate(tuple._0);
      return d;
    },
    setDayOfWeek: function (tuple) {
      var d = clone(tuple._1);
      var today = d.getDay();
      var desired = tuple._0;

      if (today > desired) {
        d.setDate(d.getDate() - (today - desired));
      } else if (today < desired) {
        d.setDate(d.getDate() + (desired - today) - 7);
      }

      return d;
    },
    setMonth: function (tuple) {
      var d = clone(tuple._1);
      d.setUTCMonth(tuple._0);
      return d;
    },
    setYear: function (tuple) {
      var d = clone(tuple._1);
      d.setFullYear(tuple._0);
      return d;
    },
    create: function (values) {
      var y = values._0,
        m = values._1,
        d = values._2,
        hr = values._3,
        min = values._4,
        s = values._5,
        ms = values._6;
      return new Date(y, m, d, hr, min, s, ms);
    }
  };
};
