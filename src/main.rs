use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};


#[get("/hello/{name}")]
async fn greet(name: web::Path<String>) -> impl Responder {
    format!("Hello {name}!")
}

#[actix_web::main] // or #[tokio::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/hello", web::get().to(|| async { "Hello World!" }))
            .service(greet)
            .service(hello)
    })
        .bind(("0.0.0.0", 3030))?
        // .bind(("127.0.0.1", 8080))?
        .run()
        .await
}
#[get("/a")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello!")
}