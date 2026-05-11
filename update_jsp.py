import sys, re

def process_file(filepath, c_forEach_block):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    pattern = re.compile(r'(<div class="col-12 col-md-4">\s*<div class="product1 vip">.*?</div>\s*</div>\s*){2,}', re.DOTALL)
    
    if pattern.search(content):
        # We need to make sure we also add taglib for JSTL if not present
        if '<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>' not in content:
            content = '<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>\n' + content
            
        new_content = pattern.sub(c_forEach_block + '\n', content)
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f'Successfully updated {filepath}')
    else:
        print(f'Pattern not found in {filepath}')

c_forEach_block = """<c:forEach var="item" items="${buildings}">
                <div class="col-12 col-md-4">
                    <div class="product1 vip">
                        <div class="product1-image new"></div>

                        <div class="product1-conntent">
                            <div class="product1-conntent-header">
                                <a href="/chi-tiet-san-pham?id=${item.id}">${item.name}</a>
                            </div>
                            <span class="product1-conntent-title">${item.managerName} - ${item.managerPhone}</span>
                            <ul class="product1-conntent-list">
                                <li class="product1-conntent-item">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>${item.address}</span>
                                </li>
                                <li class="product1-conntent-item">
                                    <i class="fa-solid fa-building"></i>
                                    <span>${item.managerName}</span>
                                </li>
                                <li class="product1-conntent-item">
                                    <i class="fa-solid fa-earth-asia"></i>
                                    <span>Diện tích: ${item.emptyArea}</span>
                                </li>
                            </ul>
                        </div>
                        <div class="product1-footer">
                            <span class="product1-footer-cost">Giá: Liên hệ</span>
                            <button class="product1-footer-detail"><a href="/chi-tiet-san-pham?id=${item.id}" style="color:#fff">Xem chi tiết</a></button>
                        </div>
                    </div>
                </div>
</c:forEach>"""

process_file('src/main/webapp/WEB-INF/views/web/list.jsp', c_forEach_block)
process_file('src/main/webapp/WEB-INF/views/web/home.jsp', c_forEach_block)