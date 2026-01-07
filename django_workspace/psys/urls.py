from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    
    # メインメニュー
    path('main_menu/', views.main_menu, name='main_menu'),
    
    # 得意先管理メニュー 
    path('customer_management_menu/', views.customer_management_menu, name='customer_management_menu'),

    # 各機能
    path('customer_search/', views.customer_search, name='customer_search'),
    path('customer_list/', views.customer_list, name='customer_list'),
    path('customer_regist/', views.customer_regist, name='customer_regist'),
    path('customer_update/', views.customer_update, name='customer_update'),
    path('customer_delete/', views.customer_delete, name='customer_delete'),
    
    # 注文履歴 (コードを受け取る)
    path('customer_history/<str:code>/', views.customer_history, name='customer_history'),
    
    # CSVダウンロード
    path('customer_export/', views.customer_export, name='customer_export'),

    #商品管理機能
    path('item_list/', views.item_list, name='item_list'),
    path('item_regist/', views.item_regist, name='item_regist'),
    path('item_update/', views.item_update, name='item_update'),
    path('item_delete/', views.item_delete, name='item_delete'),

    # 注文管理機能
    path('order_entry/',views.order_entry, name='order_entry'),
    #　総注文履歴
    path('order_list/',views.order_list, name='order_list'),
]