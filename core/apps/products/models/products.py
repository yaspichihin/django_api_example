from django.db import models

from core.apps.common.models import TimedBaseMixin


class Product(TimedBaseMixin):
    title = models.CharField(
        verbose_name="Название товара",
        max_length=255,
    )
    description = models.TextField(
        verbose_name="Описание товара",
        blank=True,
    )
    is_visible = models.BooleanField(
        verbose_name="Виден ли товар в каталоге",
        default=True,
    )

    class Meta:
        verbose_name = "Товар"
        verbose_name_plural = "Товары"

    def __str__(self):
        return self.title
