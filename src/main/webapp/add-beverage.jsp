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

        <div class="flex-1 flex flex-col h-full overflow-hidden relative bg-[#f6f8f6]">
          <header class="px-8 py-6 shrink-0 z-10 bg-white border-b border-gray-200 shadow-sm flex items-center justify-between">
            <div>
              <div class="flex items-center gap-2 text-sm text-[#4c9a66] mb-2 font-medium">
                <a href="beverages" class="hover:text-[#2ee59d] transition-colors">Menu Management</a>
                <svg xmlns="http://www.w3.org/2001/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m9 18 6-6-6-6"/></svg>
                <span class="text-gray-400">Add New Item</span>
              </div>
              <h2 class="text-3xl font-black text-[#0b3e2e] tracking-tight">Add New Beverage</h2>
            </div>
            
            <a href="beverages" class="flex items-center gap-2 text-gray-500 hover:text-gray-800 transition-colors font-semibold bg-gray-100 hover:bg-gray-200 px-4 py-2 rounded-lg">
                Cancel
            </a>
          </header>

          <div class="flex-1 overflow-y-auto px-8 py-8">
            <div class="max-w-[800px] mx-auto">
              
              <c:if test="${not empty errorMessage}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6 shadow-sm" role="alert">
                    <span class="block sm:inline">${errorMessage}</span>
                </div>
              </c:if>

              <form action="addBeverage" method="post" enctype="multipart/form-data" class="bg-white rounded-2xl shadow-sm border border-[#cfe7d7] overflow-hidden">
                <div class="p-8 flex flex-col gap-6">
                    
                    <div>
                        <h3 class="text-lg font-bold text-[#0b3e2e] mb-1">Basic Details</h3>
                        <p class="text-sm text-gray-500 mb-4">Provide the primary information for the new menu item.</p>
                        
                        <div class="space-y-4">
                            <div>
                                <label for="beverageName" class="block text-sm font-semibold text-gray-700 mb-1">Beverage Name <span class="text-red-500">*</span></label>
                                <input type="text" id="beverageName" name="beverageName" required placeholder="e.g. Signature Brown Sugar Boba" class="w-full px-4 py-2.5 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm text-[#0b3e2e] transition-colors outline-none">
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label for="category" class="block text-sm font-semibold text-gray-700 mb-1">Category <span class="text-red-500">*</span></label>
                                    <input type="text" id="category" name="category" required placeholder="e.g. Milk Tea" class="w-full px-4 py-2.5 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm text-[#0b3e2e] transition-colors outline-none">
                                </div>
                                <div>
                                    <label for="price" class="block text-sm font-semibold text-gray-700 mb-1">Base Price (RM) <span class="text-red-500">*</span></label>
                                    <div class="relative">
                                        <span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-500 font-semibold text-sm">RM</span>
                                        <input type="number" id="price" name="price" step="0.01" min="0" required placeholder="0.00" class="w-full pl-12 pr-4 py-2.5 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm text-[#0b3e2e] transition-colors outline-none">
                                    </div>
                                </div>
                            </div>

                            <div>
                                <label for="description" class="block text-sm font-semibold text-gray-700 mb-1">Description</label>
                                <textarea id="description" name="description" rows="3" placeholder="Describe the flavor profile and ingredients..." class="w-full px-4 py-2.5 bg-[#f6f8f6] border border-gray-200 focus:border-[#2ee59d] focus:ring-1 focus:ring-[#2ee59d] rounded-lg text-sm text-[#0b3e2e] transition-colors outline-none resize-none"></textarea>
                            </div>
                        </div>
                    </div>

                    <hr class="border-[#cfe7d7]">

                    <div>
                        <h3 class="text-lg font-bold text-[#0b3e2e] mb-1">Options & Image</h3>
                        <p class="text-sm text-gray-500 mb-4">Set temperature availability and upload a product photo.</p>

                        <div class="flex flex-col gap-6">
                            <div class="flex flex-wrap gap-6">
                                <label class="flex items-center gap-3 cursor-pointer group">
                                    <div class="relative flex items-center justify-center">
                                        <input type="checkbox" name="hasHot" class="peer sr-only">
                                        <div class="w-6 h-6 border-2 border-gray-300 rounded bg-white peer-checked:bg-[#2ee59d] peer-checked:border-[#2ee59d] transition-colors"></div>
                                        <svg xmlns="http://www.w3.org/2001/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="absolute inset-0 m-auto opacity-0 peer-checked:opacity-100 transition-opacity"><polyline points="20 6 9 17 4 12"/></svg>
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-gray-800">Has Hot Option</span>
                                        <span class="text-xs text-gray-500">Can be served hot</span>
                                    </div>
                                </label>

                                <label class="flex items-center gap-3 cursor-pointer group">
                                    <div class="relative flex items-center justify-center">
                                        <input type="checkbox" name="hasIce" class="peer sr-only">
                                        <div class="w-6 h-6 border-2 border-gray-300 rounded bg-white peer-checked:bg-[#2ee59d] peer-checked:border-[#2ee59d] transition-colors"></div>
                                        <svg xmlns="http://www.w3.org/2001/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="absolute inset-0 m-auto opacity-0 peer-checked:opacity-100 transition-opacity"><polyline points="20 6 9 17 4 12"/></svg>
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-gray-800">Has Ice Option</span>
                                        <span class="text-xs text-gray-500">Can be served cold</span>
                                    </div>
                                </label>
                            </div>

                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">Product Image (Required) <span class="text-red-500">*</span></label>
                                <div class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-xl bg-gray-50 hover:bg-gray-100 transition-colors relative">
                                    <div class="space-y-1 text-center">
                                    <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                        <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4h-12m12-12h-12m-12 0H8m12 0v-12" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>
                                    <div class="flex text-sm text-gray-600 justify-center">
                                        <label for="imageFile" class="relative cursor-pointer bg-white rounded-md font-medium text-green-600 hover:text-green-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-green-500 px-2">
                                        <span>Upload a file</span>
                                        <input id="imageFile" name="imageFile" type="file" required accept="image/*" class="sr-only">
                                        </label>
                                    </div>
                                    <p class="text-xs text-gray-500">PNG, JPG, GIF up to 5MB</p>
                                    <p id="fileNameDisplay" class="text-xs font-semibold text-green-700 mt-2 hidden"></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="bg-gray-50 px-8 py-5 border-t border-gray-200 flex justify-end">
                    <button type="submit" class="bg-[#2ee59d] hover:bg-[#18c985] text-green-900 font-extrabold py-2.5 px-6 rounded-lg text-sm uppercase cursor-pointer border-none shadow-sm tracking-wide transition-colors flex items-center gap-2">
                        <svg xmlns="http://www.w3.org/2001/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
                        Save Beverage
                    </button>
                </div>
              </form>

            </div>
          </div>
        </div>
    </div>

    <script>
        // Simple script to show selected file name
        document.getElementById('imageFile').addEventListener('change', function(e) {
            const fileName = e.target.files[0]?.name;
            const display = document.getElementById('fileNameDisplay');
            if (fileName) {
                display.textContent = 'Selected: ' + fileName;
                display.classList.remove('hidden');
            } else {
                display.classList.add('hidden');
            }
        });
    </script>
</body>
</html>
