
var page=new FireflyPage(env.BROWSER || "chrome@http://firefly-desktop:4444").setLocation(20,0).setSize(1024,1024); page.put("@scale",0.5);
var URL=env.APP_URL || "http://petclinic:8080";