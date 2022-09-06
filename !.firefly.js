
var page=new FireflyPage(env.BROWSER || "chrome@http://host.docker.internal:4444").setLocation(20,0).setSize(1024,1024); page.put("@scale",0.5);
var URL=env.APP_URL || "http://host.docker.internal:8080";