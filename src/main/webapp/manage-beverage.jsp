<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header.jsp"/>
</head>
<body>
    <div class="flex h-screen w-full bg-[#f6f8f6] overflow-hidden">
        <jsp:include page="sidebar.jsp"/>

        <div class="flex-1 flex flex-col h-full overflow-hidden relative bg-[#f6f8f6]">
          <header class="px-8 py-6 shrink-0 z-10 bg-white border-b border-gray-200 shadow-sm">
            <div class="max-w-[1400px] mx-auto flex flex-col md:flex-row md:justify-between md:items-center gap-6">
              <div>
                <h2 class="text-3xl font-black text-[#0b3e2e] tracking-tight">Menu Management</h2>
                <p class="text-[#4c9a66] text-sm mt-1">Manage your drinks, prices, and availability.</p>
              </div>
              <a href="add-beverage.jsp" class="flex items-center gap-2 bg-[#2ee59d] text-green-900 font-bold px-4 py-2.5 rounded-lg hover:bg-[#18c985] transition-colors shadow-sm">
                <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
                Add New Item
              </a>
            </div>
          </header>

          <div class="flex-1 overflow-y-auto px-8 py-8">
            <div class="max-w-[1400px] mx-auto flex flex-col gap-6">
              
              <c:if test="${not empty errorMessage}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4" role="alert">
                    <span class="block sm:inline">${errorMessage}</span>
                </div>
              </c:if>

              <div class="bg-white rounded-xl p-4 shadow-sm border border-[#cfe7d7] flex flex-col md:flex-row gap-4 justify-between items-center">
                <div class="relative w-full md:w-96">
                  <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute left-3 top-1/2 -translate-y-1/2 text-[#4c9a66] w-5 h-5"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
                  <input
                    type="text"
                    placeholder="Search for drinks, ingredients..."
                    class="w-full pl-10 pr-4 py-2.5 bg-[#f6f8f6] border border-transparent focus:border-[#2ee59d] focus:ring-0 rounded-lg text-sm text-[#0b3e2e] placeholder:text-[#4c9a66] transition-all outline-none"
                  />
                </div>
                <div class="flex gap-2 overflow-x-auto w-full md:w-auto pb-1 md:pb-0" id="categoryFilters">
                  <!-- Extract unique categories using JSTL -->
                  <c:set var="uniqueCategories" value="" />
                  <c:forEach var="item" items="${beverages}">
                      <c:if test="${!uniqueCategories.contains(item.beverageCategory)}">
                          <c:set var="uniqueCategories" value="${uniqueCategories}${item.beverageCategory}|" />
                      </c:if>
                  </c:forEach>
                  
                  <button data-filter="All" class="filter-btn active shrink-0 h-9 px-4 rounded-lg bg-[#0b3e2e] text-white text-sm font-medium transition-colors border border-transparent">All Items</button>
                  <c:forTokens items="${uniqueCategories}" delims="|" var="catStr">
                      <c:if test="${not empty catStr}">
                          <button data-filter="${catStr}" class="filter-btn shrink-0 h-9 px-4 rounded-lg bg-[#f6f8f6] text-[#0b3e2e] hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">${catStr}</button>
                      </c:if>
                  </c:forTokens>
                </div>
              </div>

              <div class="bg-white rounded-xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col">
                <div class="overflow-x-auto">
                  <table class="w-full text-left border-collapse">
                    <thead>
                      <tr class="bg-[#f6f8f6] border-b border-[#cfe7d7]">
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-24">Image</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider">Item Name</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-64">Description</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-32">Category</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-24">Price</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-24">Code</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-24">Ice Option</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-24">Hot Option</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-24">Status</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-16 text-right">Action</th>
                      </tr>
                    </thead>
                    <tbody class="divide-y divide-[#cfe7d7]">
                      <c:forEach var="item" items="${beverages}">
                          <tr class="group hover:bg-green-50/50 transition-colors relative">
                            <td class="px-6 py-4">
                              <img src="${not empty item.beverageImagePath ? item.beverageImagePath : 'https://images.unsplash.com/photo-1558857563-b37102e99e00?w=100&h=100&fit=crop'}" alt="${item.beverageName}" class="w-12 h-12 rounded-lg object-cover" referrerpolicy="no-referrer" />
                            </td>
                            <td class="px-6 py-4">
                              <span class="text-sm font-bold text-[#0b3e2e]">${item.beverageName}</span>
                            </td>
                            <td class="px-6 py-4">
                              <span class="text-xs text-gray-500 line-clamp-2" title="${item.beverageDescription}">${item.beverageDescription}</span>
                            </td>
                            <td class="px-6 py-4">
                              <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">${item.beverageCategory}</span>
                            </td>
                            <td class="px-6 py-4">
                              <span class="text-sm font-medium text-gray-700">RM ${item.price}</span>
                            </td>
                            <td class="px-6 py-4">
                              <span class="text-sm font-mono text-gray-500">${item.beverageCode}</span>
                            </td>
                            <td class="px-6 py-4">
                              <span class="text-sm text-gray-600">${item.hasIceOption ? 'Yes' : 'No'}</span>
                            </td>
                            <td class="px-6 py-4">
                              <span class="text-sm text-gray-600">${item.hasHotOption ? 'Yes' : 'No'}</span>
                            </td>
                            <td class="px-6 py-4">
                              <div class="flex flex-col items-start gap-1">
                                <c:choose>
                                    <c:when test="${item.available}">
                                        <form action="beverageUnAvailable" method="post" class="m-0">
                                            <input type="hidden" name="beverageid" value="${item.ID}">
                                            <button type="submit" class="w-11 h-6 bg-[#2ee59d] rounded-full relative cursor-pointer border-none p-0 flex items-center shadow-sm transition-colors hover:bg-[#18c985]">
                                              <div class="w-5 h-5 bg-white rounded-full absolute right-0.5 shadow-md"></div>
                                            </button>
                                        </form>
                                        <span class="text-[10px] text-gray-500 font-medium">In Stock</span>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="beverageAvailable" method="post" class="m-0">
                                            <input type="hidden" name="beverageid" value="${item.ID}">
                                            <button type="submit" class="w-11 h-6 bg-gray-300 rounded-full relative cursor-pointer border-none p-0 flex items-center shadow-inner transition-colors hover:bg-gray-400">
                                              <div class="w-5 h-5 bg-white rounded-full absolute left-0.5 shadow-md"></div>
                                            </button>
                                        </form>
                                        <span class="text-[10px] text-red-500 font-medium">Out of Stock</span>
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-right">
                              <button type="button" 
                                      class="edit-beverage-btn text-[#4c9a66] hover:text-[#2ee59d] bg-[#f6f8f6] hover:bg-green-100 p-2 rounded-lg transition-colors group/edit"
                                      data-id="${item.ID}"
                                      data-name="${fn:escapeXml(item.beverageName)}"
                                      data-category="${fn:escapeXml(item.beverageCategory)}"
                                      data-price="${item.price}"
                                      data-desc="${fn:escapeXml(item.beverageDescription)}"
                                      data-ice="${item.hasIceOption}"
                                      data-hot="${item.hasHotOption}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"/></svg>
                              </button>
                            </td>
                          </tr>
                      </c:forEach>
                      <c:if test="${empty beverages}">
                          <tr class="empty-row">
                              <td colspan="10" class="px-6 py-8 text-center text-gray-500">No beverages found.</td>
                          </tr>
                      </c:if>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>

    </div>

    <!-- Edit Beverage Modal -->
    <div id="editModal" class="fixed inset-0 bg-black/50 z-50 flex items-center justify-center opacity-0 pointer-events-none transition-opacity duration-200 p-4">
        <div class="bg-white rounded-2xl shadow-xl w-full max-w-[600px] overflow-hidden transform translate-y-4 transition-transform duration-200" id="editModalContent">
            <header class="px-6 py-4 border-b border-gray-100 flex items-center justify-between bg-gray-50/50">
                <h3 class="text-xl font-bold text-[#0b3e2e]">Edit Beverage</h3>
                <button type="button" onclick="closeEditModal()" class="text-gray-400 hover:text-gray-600 bg-white hover:bg-gray-100 p-1.5 rounded-lg border border-transparent hover:border-gray-200 transition-all">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg>
                </button>
            </header>
            <form action="editBeverage" method="post" class="p-6">
                <input type="hidden" name="beverageid" id="edit_beverageid" value="">
                <div class="space-y-4 mb-6">
                    <div>
                        <label for="edit_beveragename" class="block text-sm font-semibold text-gray-700 mb-1">Beverage Name <span class="text-red-500">*</span></label>
                        <input type="text" id="edit_beveragename" name="beveragename" required class="w-full px-4 py-2 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm transition-colors outline-none">
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="edit_category" class="block text-sm font-semibold text-gray-700 mb-1">Category <span class="text-red-500">*</span></label>
                            <input type="text" id="edit_category" name="category" required class="w-full px-4 py-2 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm transition-colors outline-none">
                        </div>
                        <div>
                            <label for="edit_price" class="block text-sm font-semibold text-gray-700 mb-1">Base Price (RM) <span class="text-red-500">*</span></label>
                            <input type="number" step="0.01" min="0" id="edit_price" name="price" required class="w-full px-4 py-2 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm transition-colors outline-none">
                        </div>
                    </div>
                    <div>
                        <label for="edit_description" class="block text-sm font-semibold text-gray-700 mb-1">Description</label>
                        <textarea id="edit_description" name="description" rows="2" class="w-full px-4 py-2 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm transition-colors outline-none resize-none"></textarea>
                    </div>
                    <div class="flex gap-6 mt-2 pt-4 border-t border-gray-100">
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="checkbox" name="hotoption" id="edit_hotoption" value="true" class="w-4 h-4 text-[#2ee59d] rounded border-gray-300 focus:ring-[#2ee59d]">
                            <span class="text-sm font-medium text-gray-700">Has Hot Option</span>
                        </label>
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="checkbox" name="iceoption" id="edit_iceoption" value="true" class="w-4 h-4 text-[#2ee59d] rounded border-gray-300 focus:ring-[#2ee59d]">
                            <span class="text-sm font-medium text-gray-700">Has Ice Option</span>
                        </label>
                    </div>
                </div>
                <div class="flex justify-end gap-3 pt-4 border-t border-gray-100">
                    <button type="button" onclick="closeEditModal()" class="px-5 py-2 rounded-lg font-semibold text-gray-600 hover:bg-gray-100 transition-colors text-sm">Cancel</button>
                    <button type="submit" class="px-5 py-2 rounded-lg font-bold bg-[#2ee59d] hover:bg-[#18c985] text-green-900 transition-colors text-sm shadow-sm flex items-center gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/><polyline points="17 21 17 13 7 13 7 21"/><polyline points="7 3 7 8 15 8"/></svg>
                        Save Changes
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
      document.addEventListener('DOMContentLoaded', () => {
        const buttons = document.querySelectorAll('.filter-btn');
        const rows = document.querySelectorAll('tbody tr:not(.empty-row)');
        const emptyRow = document.querySelector('.empty-row');
        
        let activeCategory = 'All';

        function updateVisibility() {
          let visibleCount = 0;
          rows.forEach(row => {
            const categoryCell = row.querySelector('td:nth-child(4)').textContent.trim();
            const textContent = row.textContent.toLowerCase();
            
            const matchesCategory = (activeCategory === 'All' || categoryCell.includes(activeCategory));
            
            if (matchesCategory) {
              row.style.display = '';
              visibleCount++;
            } else {
              row.style.display = 'none';
            }
          });

          if (emptyRow) {
             emptyRow.style.display = visibleCount === 0 ? '' : 'none';
          }
        }

        buttons.forEach(btn => {
          btn.addEventListener('click', () => {
            buttons.forEach(b => {
              b.classList.remove('bg-[#0b3e2e]', 'text-white');
              b.classList.add('bg-[#f6f8f6]', 'text-[#0b3e2e]');
            });
            btn.classList.remove('bg-[#f6f8f6]', 'text-[#0b3e2e]');
            btn.classList.add('bg-[#0b3e2e]', 'text-white');

            activeCategory = btn.getAttribute('data-filter');
            updateVisibility();
          });
        });
        
        const searchInput = document.querySelector('input[placeholder="Search for drinks, ingredients..."]');
        if (searchInput) {
          searchInput.addEventListener('input', (e) => {
             const term = e.target.value.toLowerCase();
             let visibleCount = 0;
             rows.forEach(row => {
                const categoryCell = row.querySelector('td:nth-child(4)').textContent.trim();
                const text = row.textContent.toLowerCase();
                const matchesCategory = (activeCategory === 'All' || categoryCell.includes(activeCategory));
                
                if (matchesCategory && text.includes(term)) {
                   row.style.display = '';
                   visibleCount++;
                } else {
                   row.style.display = 'none';
                }
             });
             if (emptyRow) {
               emptyRow.style.display = visibleCount === 0 ? '' : 'none';
             }
          });
        }
      });

      // Edit Modal Functions
      const editModal = document.getElementById('editModal');
      const editModalContent = document.getElementById('editModalContent');

      document.querySelectorAll('.edit-beverage-btn').forEach(btn => {
          btn.addEventListener('click', function() {
              document.getElementById('edit_beverageid').value = this.dataset.id;
              document.getElementById('edit_beveragename').value = this.dataset.name;
              document.getElementById('edit_category').value = this.dataset.category;
              document.getElementById('edit_price').value = this.dataset.price;
              document.getElementById('edit_description').value = this.dataset.desc;
              document.getElementById('edit_iceoption').checked = (this.dataset.ice === 'true');
              document.getElementById('edit_hotoption').checked = (this.dataset.hot === 'true');

              editModal.classList.remove('opacity-0', 'pointer-events-none');
              editModalContent.classList.remove('translate-y-4');
          });
      });

      function closeEditModal() {
          editModal.classList.add('opacity-0', 'pointer-events-none');
          editModalContent.classList.add('translate-y-4');
      }

      // Close modal on outside click
      editModal.addEventListener('click', (e) => {
          if (e.target === editModal) {
              closeEditModal();
          }
      });
    </script>
</body>
</html>
