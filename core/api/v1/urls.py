from ninja import Router

from .products.handlers import router as product_router


router = Router()
router.add_router(prefix="products/", router=product_router)
