riot.compile(function(){
  riot.mount('*');
  route.base('/'); //urlのベース
  route.start(true); //url監視
});

window.onload = function(){
	$(function() {
		$(".loadcon").fadeOut();
		$(".app").fadeIn();
	});
}
