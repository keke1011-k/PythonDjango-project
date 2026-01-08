import csv
import datetime
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib import messages
from .models import Customer, Employee, Orders, Item

# --- ログイン・メニュー関連 ---

def index(request):
    """トップページ画面"""
    if 'login_user_id' in request.session:
        return redirect('main_menu')
    return render(request, 'psys/index.html')

def login_view(request):
    """ログイン画面・処理"""
    if 'login_user_id' in request.session:
        return redirect('main_menu')

    if request.method == 'POST':
        employee_no = request.POST.get('employee_no')
        password = request.POST.get('password')

        try:
            user = Employee.objects.get(employee_no=employee_no, password=password)
            request.session['login_user_id'] = user.employee_no
            request.session['login_user_name'] = user.employee_name
            return redirect('main_menu')
        except Employee.DoesNotExist:
            messages.error(request, '従業員番号またはパスワードが間違っています。')
            return render(request, 'psys/login.html')
    else:
        return render(request, 'psys/login.html')

def logout_view(request):
    """ログアウト処理"""
    request.session.flush()
    return redirect('index')

def main_menu(request):
    """管理メニュー画面"""
    if 'login_user_id' not in request.session:
        return redirect('login')
    
    # ダッシュボード集計
    customer_count = Customer.objects.filter(delete_flag=0).count()
    try:
        order_count = Orders.objects.count()
    except:
        order_count = 0

    context = {
        'customer_count': customer_count,
        'order_count': order_count,
    }
    return render(request, 'psys/main_menu.html', context)


# --- 得意先管理関連 ---

def customer_management_menu(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    return render(request, 'psys/customer_management_menu.html')

def customer_search(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    context = {}
    if request.method == 'POST':
        customer_code_input = request.POST.get('customer_code')
        try:
            customer_data = Customer.objects.get(customer_code=customer_code_input, delete_flag=0)
            context['customer'] = customer_data
        except Customer.DoesNotExist:
            messages.error(request, '該当する得意先コードは存在しません。')
    return render(request, 'psys/customer_search.html', context)

def customer_list(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    query = request.GET.get('q')
    customer_list_qs = Customer.objects.filter(delete_flag=0)
    if query:
        customer_list_qs = customer_list_qs.filter(customer_name__icontains=query)
    
    customer_list = customer_list_qs.order_by('customer_code')
    if not customer_list.exists() and not query:
        messages.error(request, '得意先データがありません。')
        
    context = {'customer_list': customer_list, 'query': query}
    return render(request, 'psys/customer_list.html', context)

def customer_regist(request):
    if 'login_user_id' not in request.session:
        return redirect('login')

    if request.method == 'POST':
        code = request.POST.get('customer_code')
        name = request.POST.get('customer_name')
        telno = request.POST.get('customer_telno')
        postalcode = request.POST.get('customer_postalcode')
        address = request.POST.get('customer_address')
        discount_rate_str = request.POST.get('discount_rate')
        discount = int(discount_rate_str) if discount_rate_str else 0

        try:
            existing_customer = Customer.objects.get(customer_code=code)
            if existing_customer.delete_flag == 0:
                messages.error(request, f'得意先コード「{code}」は既に使用されています。')
            else:
                # 再有効化
                existing_customer.customer_name = name
                existing_customer.customer_telno = telno
                existing_customer.customer_postalcode = postalcode
                existing_customer.customer_address = address
                existing_customer.discount_rate = discount
                existing_customer.delete_flag = 0
                existing_customer.save()
                messages.success(request, f'削除済みの得意先「{code}」を新しい情報で再登録しました。')
        except Customer.DoesNotExist:
            # 新規登録
            new_customer = Customer(
                customer_code=code, customer_name=name, customer_telno=telno,
                customer_postalcode=postalcode, customer_address=address,
                discount_rate=discount, delete_flag=0
            )
            new_customer.save()
            messages.success(request, '登録が完了しました。')
        except Exception:
            messages.error(request, '登録できませんでした。')
        return render(request, 'psys/customer_regist.html')
    else:
        return render(request, 'psys/customer_regist.html')

def customer_update(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    context = {}
    if request.method == 'POST':
        if 'search' in request.POST:
            customer_code_input = request.POST.get('customer_code')
            try:
                context['customer'] = Customer.objects.get(customer_code=customer_code_input, delete_flag=0)
            except Customer.DoesNotExist:
                messages.error(request, '該当する得意先コードは存在しません。')
            return render(request, 'psys/customer_update.html', context)
        elif 'update' in request.POST:
            code = request.POST.get('customer_code')
            try:
                customer_to_update = Customer.objects.get(customer_code=code, delete_flag=0)
                customer_to_update.customer_name = request.POST.get('customer_name')
                customer_to_update.customer_telno = request.POST.get('customer_telno')
                customer_to_update.customer_postalcode = request.POST.get('customer_postalcode')
                customer_to_update.customer_address = request.POST.get('customer_address')
                discount_rate_str = request.POST.get('discount_rate')
                customer_to_update.discount_rate = int(discount_rate_str) if discount_rate_str else 0
                customer_to_update.save()
                messages.success(request, '更新を完了しました。')
                context['customer'] = customer_to_update
            except Exception:
                messages.error(request, '更新できませんでした。')
            return render(request, 'psys/customer_update_result.html', context)
    return render(request, 'psys/customer_update.html')

def customer_delete(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    context = {}
    if request.method == 'POST':
        if 'search' in request.POST:
            customer_code_input = request.POST.get('customer_code')
            try:
                context['customer'] = Customer.objects.get(customer_code=customer_code_input, delete_flag=0)
            except Customer.DoesNotExist:
                messages.error(request, '該当する得意先コードは存在しません。')
            return render(request, 'psys/customer_delete.html', context)
        elif 'delete' in request.POST:
            code = request.POST.get('customer_code')
            try:
                customer_to_delete = Customer.objects.get(customer_code=code, delete_flag=0)
                customer_to_delete.delete_flag = 1
                customer_to_delete.save()
                messages.success(request, '削除しました。')
            except Exception:
                messages.error(request, '削除できませんでした。')
            return render(request, 'psys/customer_delete_result.html')
    return render(request, 'psys/customer_delete.html')

def customer_history(request, code):
    if 'login_user_id' not in request.session:
        return redirect('login')
    context = {}
    try:
        customer = Customer.objects.get(customer_code=code, delete_flag=0)
        context['customer'] = customer
        order_list = Orders.objects.filter(customer_code=customer).order_by('-order_date')
        context['order_list'] = order_list
    except Customer.DoesNotExist:
        messages.error(request, '該当する得意先が存在しません。')
        return redirect('customer_list')
    return render(request, 'psys/customer_history.html', context)

def customer_export(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    response = HttpResponse(content_type='text/csv; charset=cp932')
    response['Content-Disposition'] = 'attachment; filename="customers.csv"'
    writer = csv.writer(response)
    writer.writerow(['得意先コード', '得意先名', '電話番号', '郵便番号', '住所', '割引率'])
    customers = Customer.objects.filter(delete_flag=0).order_by('customer_code')
    for c in customers:
        writer.writerow([c.customer_code, c.customer_name, c.customer_telno, c.customer_postalcode, c.customer_address, c.discount_rate])
    return response


# --- 商品管理関連 (IDを受け取る形に修正済み) ---

def item_list(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    items = Item.objects.all().order_by('item_code')
    return render(request, 'psys/item_list.html', {'items': items})

def item_regist(request):
    if 'login_user_id' not in request.session:
        return redirect('login')

    if request.method == 'POST':
        code = request.POST.get('item_code')
        name = request.POST.get('item_name')
        price = request.POST.get('price')
        stock = request.POST.get('stock')

        try:
            if Item.objects.filter(item_code=code).exists():
                messages.error(request, f'商品コード「{code}」は既に登録されています。')
            else:
                new_item = Item(
                    item_code=code,
                    item_name=name,
                    price=int(price) if price else 0,
                    stock=int(stock) if stock else 0
                )
                new_item.save()
                messages.success(request, '商品を登録しました。')
        except Exception:
            messages.error(request, '登録に失敗しました。')

    return render(request, 'psys/item_regist.html')

def item_update(request, pk):
    """商品更新 (URLのIDを使用)"""
    if 'login_user_id' not in request.session:
        return redirect('login')

    # URLのID(pk)を使って商品を検索
    item = get_object_or_404(Item, pk=pk)

    if request.method == 'POST':
        try:
            item.item_name = request.POST.get('item_name')
            item.price = int(request.POST.get('price'))
            item.stock = int(request.POST.get('stock'))
            item.save()
            messages.success(request, '商品情報を更新しました。')
            return redirect('item_list') # 更新後は一覧に戻る
        except Exception:
            messages.error(request, '更新に失敗しました。')
    
    return render(request, 'psys/item_update.html', {'item': item})

def item_delete(request, pk):
    """商品削除 (URLのIDを使用)"""
    if 'login_user_id' not in request.session:
        return redirect('login')

    # URLのID(pk)を使って商品を検索
    item = get_object_or_404(Item, pk=pk)

    if request.method == 'POST':
        try:
            item.delete()
            messages.success(request, '商品を削除しました。')
            return redirect('item_list') # 削除後は一覧に戻る
        except Exception:
            messages.error(request, '削除に失敗しました。')
    
    return render(request, 'psys/item_delete.html', {'item': item})


# --- 注文管理関連 ---

def order_entry(request):
    if 'login_user_id' not in request.session:
        return redirect('login')

    # 画面表示用データ
    context = {
        'customers': Customer.objects.filter(delete_flag=0),
        'items': Item.objects.all(),
        'today': datetime.date.today().strftime('%Y-%m-%d')
    }

    if request.method == 'POST':
        customer_code = request.POST.get('customer_code')
        item_code = request.POST.get('item_code')
        quantity = request.POST.get('quantity')
        order_date = request.POST.get('order_date')
        deliver_date = request.POST.get('deliver_date')

        try:
            # 1. 注文番号自動生成
            last_order = Orders.objects.order_by('-order_no').first()
            if last_order:
                new_no = int(last_order.order_no) + 1
                new_order_no = f"{new_no:06d}"
            else:
                new_order_no = "000001"

            # 2. 必要なデータを取得・計算
            item = Item.objects.get(item_code=item_code)
            total_price = item.price * int(quantity)
            employee = Employee.objects.get(employee_no=request.session['login_user_id'])
            customer = Customer.objects.get(customer_code=customer_code)

            # 3. 保存
            new_order = Orders(
                order_no=new_order_no,
                customer_code=customer,
                employee_no=employee,
                total_price=total_price,
                detail_num=int(quantity),
                order_date=order_date,
                deliver_date=deliver_date
            )
            new_order.save()
            messages.success(request, f'注文を登録しました！ 合計金額: ¥{total_price}')
            
        except Exception as e:
            messages.error(request, f'登録に失敗しました... エラー: {e}')

    return render(request, 'psys/order_entry.html', context)

def order_list(request):
    if 'login_user_id' not in request.session:
        return redirect('login')
    
    orders = Orders.objects.all().order_by('-order_date')
    return render(request, 'psys/order_list.html', {'orders': orders})