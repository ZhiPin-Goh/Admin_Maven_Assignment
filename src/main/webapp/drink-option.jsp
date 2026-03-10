<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header.jsp"/>
</head>
<body>
    <div class="flex h-screen w-full bg-[#f6f8f6] overflow-hidden">
        <jsp:include page="sidebar.jsp"/>

        <div class="flex-1 flex flex-col h-full overflow-hidden bg-[#f6f8f6]">
          <header class="px-8 py-6 shrink-0 bg-white border-b border-gray-200 shadow-sm">
            <div class="max-w-[1400px] mx-auto">
              <h2 class="text-3xl font-black text-[#0b3e2e] tracking-tight">Drink Options</h2>
              <p class="text-[#4c9a66] text-sm mt-1">Configure customization levels for your beverages.</p>
            </div>
          </header>

          <div class="flex-1 overflow-y-auto px-8 py-8">
            <c:if test="${not empty errorMessage}">
                <div class="max-w-[1400px] mx-auto bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6" role="alert">
                    <span class="block sm:inline">${errorMessage}</span>
                </div>
            </c:if>

            <div class="max-w-[1400px] mx-auto grid grid-cols-1 lg:grid-cols-3 gap-8">
              
              <!-- Ice Levels -->
              <div class="bg-white rounded-2xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col h-fit">
                <div class="p-6 border-b border-[#cfe7d7] flex items-center justify-between bg-[#f6f8f6]/50">
                  <div class="flex items-center gap-3">
                    <div class="p-2 bg-[#2ee59d]/20 rounded-lg">
                      <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 text-green-800"><path d="M14 4v10.54a4 4 0 1 1-4 0V4a2 2 0 0 1 4 0Z"/></svg>
                    </div>
                    <h3 class="font-bold text-[#0b3e2e]">Ice Level</h3>
                  </div>
                  <button type="button" onclick="openAddModal('ice')" class="p-1.5 hover:bg-[#2ee59d]/20 rounded-lg transition-colors text-[#18c985]">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
                  </button>
                </div>
                <div class="p-4 space-y-3">
                  <c:forEach var="ice" items="${ices}">
                    <div class="group flex items-center justify-between p-3 rounded-xl border border-gray-100 bg-white hover:border-[#2ee59d]/30 hover:shadow-sm transition-all">
                        <div class="flex-1 flex items-center justify-between mr-4">
                            <span class="text-sm font-bold text-[#0b3e2e]">${ice.iceOption}</span>
                            <span class="text-xs font-medium text-[#4c9a66] bg-[#f6f8f6] px-2 py-0.5 rounded-full">ID: ${ice.ID}</span>
                        </div>
                        <div class="flex items-center gap-1 shrink-0">
                            <form action="deleteIceOption" method="post" class="m-0" onsubmit="return confirm('Are you sure you want to delete this ice option?');">
                                <input type="hidden" name="iceoptionid" value="${ice.ID}">
                                <button type="submit" class="p-1.5 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-md transition-colors opacity-0 group-hover:opacity-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4"><path d="M3 6h18"/><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/><line x1="10" x2="10" y1="11" y2="17"/><line x1="14" x2="14" y1="11" y2="17"/></svg>
                                </button>
                            </form>
                        </div>
                    </div>
                  </c:forEach>
                  <c:if test="${empty ices}">
                    <div class="text-center py-8">
                      <p class="text-xs text-[#4c9a66] italic">No ice options found.</p>
                    </div>
                  </c:if>
                </div>
              </div>

              <!-- Sugar Levels -->
              <div class="bg-white rounded-2xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col h-fit">
                <div class="p-6 border-b border-[#cfe7d7] flex items-center justify-between bg-[#f6f8f6]/50">
                  <div class="flex items-center gap-3">
                    <div class="p-2 bg-[#2ee59d]/20 rounded-lg">
                      <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 text-green-800"><path d="M7 16.3c2.2 0 4-1.83 4-4.05 0-1.16-.57-2.26-1.71-3.19S7.29 6.75 7 5.3c-.29 1.45-1.14 2.84-2.29 3.76S3 11.1 3 12.25c0 2.22 1.8 4.05 4 4.05z"/><path d="M12.56 6.6A10.97 10.97 0 0 0 14 3.02c.5 2.5 2 4.9 4 6.5s3 3.5 3 5.5a6.98 6.98 0 0 1-11.91 4.97"/></svg>
                    </div>
                    <h3 class="font-bold text-[#0b3e2e]">Sugar Level</h3>
                  </div>
                  <button type="button" onclick="openAddModal('sugar')" class="p-1.5 hover:bg-[#2ee59d]/20 rounded-lg transition-colors text-[#18c985]">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
                  </button>
                </div>
                <div class="p-4 space-y-3">
                  <c:forEach var="sugar" items="${sugars}">
                    <div class="group flex items-center justify-between p-3 rounded-xl border border-gray-100 bg-white hover:border-[#2ee59d]/30 hover:shadow-sm transition-all">
                        <div class="flex-1 flex items-center justify-between mr-4">
                            <span class="text-sm font-bold text-[#0b3e2e]">${sugar.sugarOption}</span>
                            <span class="text-xs font-medium text-[#4c9a66] bg-[#f6f8f6] px-2 py-0.5 rounded-full">ID: ${sugar.ID}</span>
                        </div>
                        <div class="flex items-center gap-1 shrink-0">
                            <form action="deleteSugarOption" method="post" class="m-0" onsubmit="return confirm('Are you sure you want to delete this sugar option?');">
                                <input type="hidden" name="sugaroptionid" value="${sugar.ID}">
                                <button type="submit" class="p-1.5 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-md transition-colors opacity-0 group-hover:opacity-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4"><path d="M3 6h18"/><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/><line x1="10" x2="10" y1="11" y2="17"/><line x1="14" x2="14" y1="11" y2="17"/></svg>
                                </button>
                            </form>
                        </div>
                    </div>
                  </c:forEach>
                  <c:if test="${empty sugars}">
                    <div class="text-center py-8">
                      <p class="text-xs text-[#4c9a66] italic">No sugar options found.</p>
                    </div>
                  </c:if>
                </div>
              </div>

              <!-- Cup Sizes -->
              <div class="bg-white rounded-2xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col h-fit">
                <div class="p-6 border-b border-[#cfe7d7] flex items-center justify-between bg-[#f6f8f6]/50">
                  <div class="flex items-center gap-3">
                    <div class="p-2 bg-[#2ee59d]/20 rounded-lg">
                      <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 text-green-800"><path d="M8 3v3h8V3"/><path d="M4 8v2h16V8"/><path d="M16 10v11L8 21v-11"/></svg>
                    </div>
                    <h3 class="font-bold text-[#0b3e2e]">Cup Size</h3>
                  </div>
                  <button type="button" onclick="openAddModal('size')" class="p-1.5 hover:bg-[#2ee59d]/20 rounded-lg transition-colors text-[#18c985]">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
                  </button>
                </div>
                <div class="p-4 space-y-3">
                  <c:forEach var="size" items="${sizes}">
                    <div class="group flex items-center justify-between p-3 rounded-xl border border-gray-100 bg-white hover:border-[#2ee59d]/30 hover:shadow-sm transition-all">
                        <div class="flex-1 flex items-center justify-between mr-4">
                            <span class="text-sm font-bold text-[#0b3e2e]">${size.beverageSize}</span>
                            <span class="text-xs font-medium text-[#4c9a66] bg-[#f6f8f6] px-2 py-0.5 rounded-full">+RM ${size.priceModifier}</span>
                        </div>
                        <div class="flex items-center gap-1 shrink-0">
                            <form action="deleteSize" method="post" class="m-0" onsubmit="return confirm('Are you sure you want to delete this size option?');">
                                <input type="hidden" name="sizeid" value="${size.ID}">
                                <button type="submit" class="p-1.5 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-md transition-colors opacity-0 group-hover:opacity-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4"><path d="M3 6h18"/><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/><line x1="10" x2="10" y1="11" y2="17"/><line x1="14" x2="14" y1="11" y2="17"/></svg>
                                </button>
                            </form>
                        </div>
                    </div>
                  </c:forEach>
                  <c:if test="${empty sizes}">
                    <div class="text-center py-8">
                      <p class="text-xs text-[#4c9a66] italic">No size options found.</p>
                    </div>
                  </c:if>
                </div>
              </div>

            </div>
          </div>
        </div>
          </div>
        </div>
    </div>

    <!-- Dynamic Add Modal -->
    <div id="addModal" class="fixed inset-0 bg-black/50 z-50 flex items-center justify-center opacity-0 pointer-events-none transition-opacity duration-200 p-4">
        <div class="bg-white rounded-2xl shadow-xl w-full max-w-[400px] overflow-hidden transform translate-y-4 transition-transform duration-200" id="addModalContent">
            <header class="px-6 py-4 border-b border-gray-100 flex items-center justify-between bg-gray-50/50">
                <h3 class="text-xl font-bold text-[#0b3e2e]" id="modalTitle">Add Option</h3>
                <button type="button" onclick="closeAddModal()" class="text-gray-400 hover:text-gray-600 bg-white hover:bg-gray-100 p-1.5 rounded-lg border border-transparent hover:border-gray-200 transition-all">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg>
                </button>
            </header>
            
            <form id="addForm" action="" method="post" class="p-6">
                <!-- Generic Name Input -->
                <div class="space-y-4 mb-6">
                    <div id="nameInputWrapper">
                        <label id="nameInputLabel" class="block text-sm font-semibold text-gray-700 mb-1">Option Name <span class="text-red-500">*</span></label>
                        <input type="text" id="add_name_input" name="" required placeholder="e.g. Less Sugar, Large, Normal Ice" class="w-full px-4 py-2 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm transition-colors outline-none">
                    </div>
                    <!-- Price Modifier Input (only for size) -->
                    <div id="priceModifierWrapper" class="hidden">
                        <label class="block text-sm font-semibold text-gray-700 mb-1">Price Modifier (RM) <span class="text-red-500">*</span></label>
                        <input type="number" step="0.01" min="0" value="0.00" id="add_price_input" name="pricemodifier" class="w-full px-4 py-2 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm transition-colors outline-none">
                    </div>
                </div>

                <div class="flex justify-end gap-3 pt-4 border-t border-gray-100">
                    <button type="button" onclick="closeAddModal()" class="px-5 py-2 rounded-lg font-semibold text-gray-600 hover:bg-gray-100 transition-colors text-sm">Cancel</button>
                    <button type="submit" class="px-5 py-2 rounded-lg font-bold bg-[#2ee59d] hover:bg-[#18c985] text-green-900 transition-colors text-sm shadow-sm">
                        Confirm Add
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
      const addModal = document.getElementById('addModal');
      const addModalContent = document.getElementById('addModalContent');
      const addForm = document.getElementById('addForm');
      const modalTitle = document.getElementById('modalTitle');
      const nameInput = document.getElementById('add_name_input');
      const nameInputLabel = document.getElementById('nameInputLabel');
      const priceModifierWrapper = document.getElementById('priceModifierWrapper');
      const priceInput = document.getElementById('add_price_input');

      function openAddModal(type) {
          nameInput.value = '';
          priceInput.value = '0.00';
          
          if (type === 'ice') {
              modalTitle.textContent = 'Add Ice Level';
              nameInputLabel.textContent = 'Ice Option Name';
              nameInput.name = 'iceoption';
              addForm.action = 'addIceOption';
              priceModifierWrapper.classList.add('hidden');
              priceInput.removeAttribute('required');
          } else if (type === 'sugar') {
              modalTitle.textContent = 'Add Sugar Level';
              nameInputLabel.textContent = 'Sugar Option Name';
              nameInput.name = 'sugaroption';
              addForm.action = 'addSugarOption';
              priceModifierWrapper.classList.add('hidden');
              priceInput.removeAttribute('required');
          } else if (type === 'size') {
              modalTitle.textContent = 'Add Cup Size';
              nameInputLabel.textContent = 'Size Name';
              nameInput.name = 'beveragesize';
              addForm.action = 'addSize';
              priceModifierWrapper.classList.remove('hidden');
              priceInput.setAttribute('required', 'true');
          }

          addModal.classList.remove('opacity-0', 'pointer-events-none');
          addModalContent.classList.remove('translate-y-4');
          setTimeout(() => nameInput.focus(), 100);
      }

      function closeAddModal() {
          addModal.classList.add('opacity-0', 'pointer-events-none');
          addModalContent.classList.add('translate-y-4');
      }

      addModal.addEventListener('click', (e) => {
          if (e.target === addModal) {
              closeAddModal();
          }
      });
    </script>
</body>
</html>
