/*global $, _, location*/
var tags = (function () {
  var finalTime = null;
  var refreshTweet = function () {
    $.getJSON(location.href + "/tweets.json", function (tweets) {
      var template = _.template($("#tweet_template").text());
      $("#tweets").empty();
      _.each(tweets, function (tweet) {
        $("#tweets").append(template(tweet));
      });
    });
  };
  
  return {
    refreshTweet: refreshTweet
  };
}());
