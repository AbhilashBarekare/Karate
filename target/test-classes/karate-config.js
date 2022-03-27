function fn(){
	
	var config={
		name : "abhilash",
		baseURL : 'https://reqres.in/api'
	};
	var env=karate.env
	karate.log('the value on env is: ', env);

	if(env== 'qa'){
		config.baseURL= 'https://reqres.in/api'
	}else If(env== 'dev');{
		config.baseURL= 'https://reqres.in/api'
	}
	//karate.configure('connectionTimeout',5000);
	//karate.configure('readTimeout',5000);	
	//karate.configure('connectionTimeout',5000);
	//karate.configure('readTimeout',5000);
	return config;
	
}