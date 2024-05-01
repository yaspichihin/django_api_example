from django.core.handlers.wsgi import WSGIRequest
from django.urls import path
from ninja import NinjaAPI

from .schemas import PingResponseSchema
from .v1.urls import router as v1_router

api = NinjaAPI()


@api.get("/ping", response=PingResponseSchema)
def ping(request: WSGIRequest) -> dict:
    return {"result": True}


api.add_router(prefix="v1/", router=v1_router)


urlpatterns = [
    path("", api.urls),
]
