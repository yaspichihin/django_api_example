from django.contrib import admin

from core.apps.products.models.products import Product


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    # Указываем какие поля отображать
    list_display = ("id", "title", "created_at", "updated_at")
