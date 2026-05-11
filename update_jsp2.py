import sys

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Update the manager name placeholder
    content = content.replace('${item.managerName} - ${item.managerPhone}', '<c:choose><c:when test="${empty item.managerName}">Chưa có quản lý</c:when><c:otherwise>Tên quản lý: ${item.managerName} - ${item.managerPhone}</c:otherwise></c:choose>')
    
    # Update manager name alone in list
    content = content.replace('<span>${item.managerName}</span>', '<span><c:choose><c:when test="${empty item.managerName}">Chưa có quản lý</c:when><c:otherwise>Tên quản lý: ${item.managerName}</c:otherwise></c:choose></span>')
    
    # Add prefix Địa chỉ
    content = content.replace('<span>${item.address}</span>', '<span>Địa chỉ: ${item.address}</span>')

    # Update empty area unit
    content = content.replace('<span>Diện tích: ${item.emptyArea}</span>', '<span>Diện tích: ${item.emptyArea} m^2</span>')
    
    # Update price unit in list
    # Need to verify if rentPrice is currently exposed in list.jsp via BuildingSearchResponse. Let's add rentPrice to BuildingSearchResponse later if it's missing, but for now we format it.
    content = content.replace('<span class="product1-footer-cost">Giá: Liên hệ</span>', '<span class="product1-footer-cost">Giá thuê: <c:choose><c:when test="${empty item.rentPrice}">Liên hệ</c:when><c:otherwise>${item.rentPrice} triệu/tháng</c:otherwise></c:choose></span>')

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f'Successfully updated {filepath}')

process_file('src/main/webapp/WEB-INF/views/web/list.jsp')
process_file('src/main/webapp/WEB-INF/views/web/home.jsp')