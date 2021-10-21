addEventListener(
    "fetch",event => {
       let url=new URL(event.request.url);
       url.hostname="github-releases.githubusercontent.com";
       let request=new Request(url,event.request);
       event.respondWith(
         fetch(request)
       )
    }
  )