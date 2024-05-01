from ninja import Router
from django.core.handlers.wsgi import WSGIRequest

from core.api.v1.products.schemas import ProductListSchema


router = Router(tags=["Products"])


@router.get("", response=ProductListSchema)
def get_product_list_handler(request: WSGIRequest) -> list:
    return []
