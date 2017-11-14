riot.compile(function(){
  riot.mount('*');
  route.base('/'); //urlのベース
  route.start(true); //url監視
});
