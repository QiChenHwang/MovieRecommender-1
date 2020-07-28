
function requestType(){
    $.ajax({
        type: "POST", //请求的方式，默认get请求
        url: "Recommendaction", //请求地址，后台提供的
        data: {type:'userBased'},//data是传给后台的字段，后台需要哪些就传入哪些
        //dataType: "json", //json格式，如果后台返回的数据为json格式的数据，那么前台会收到Object
    })
}