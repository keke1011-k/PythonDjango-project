from django.db import models

class Customer(models.Model):
    customer_code = models.CharField(max_length=6, primary_key=True)
    customer_name = models.CharField(max_length=32, null=True)
    customer_telno = models.CharField(max_length=13, null=True)
    customer_postalcode = models.CharField(max_length=8, null=True)
    customer_address = models.CharField(max_length=40, null=True)
    discount_rate = models.IntegerField(null=True)
    delete_flag = models.IntegerField(default=0)

    class Meta:
        db_table = 'customer'

class Employee(models.Model):
    employee_no = models.CharField(max_length=6, primary_key=True)
    employee_name = models.CharField(max_length=32, null=True)
    password = models.CharField(max_length=8, null=True)

    class Meta:
        db_table = 'employee'

class Item(models.Model):
    item_code = models.CharField(max_length=6, primary_key=True)
    item_name = models.CharField(max_length=32, null=True)
    price = models.IntegerField(null=True)
    stock = models.IntegerField(null=True)

    class Meta:
        db_table = 'item'

class Orders(models.Model):
    order_no = models.CharField(max_length=6, primary_key=True)
    # Customerテーブルと紐づく設定
    customer_code = models.ForeignKey(Customer, on_delete=models.DO_NOTHING, db_column='customer_code')
    employee_no = models.ForeignKey(Employee, on_delete=models.DO_NOTHING, db_column='employee_no')
    total_price = models.IntegerField(null=True)
    detail_num = models.IntegerField(null=True)
    deliver_date = models.DateField(null=True)
    order_date = models.DateField(null=True)

    class Meta:
        db_table = 'orders'

class OrderDetails(models.Model):
    # 複合主キーはDjango標準では扱いにくいので、主キー設定は省略しid自動生成に任せるか、Metaで指定します
    # ここでは簡易的に定義します
    order_no = models.ForeignKey(Orders, on_delete=models.DO_NOTHING, db_column='order_no')
    item_code = models.ForeignKey(Item, on_delete=models.DO_NOTHING, db_column='item_code')
    order_num = models.IntegerField(null=True)
    order_price = models.IntegerField(null=True)

    class Meta:
        db_table = 'order_details'