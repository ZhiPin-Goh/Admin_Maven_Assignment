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
          <header class="bg-white px-8 py-6 shrink-0 z-10 border-b border-gray-200 shadow-sm">
            <div class="max-w-[1400px] mx-auto flex flex-col md:flex-row md:justify-between md:items-center gap-6">
              <div>
                <h2 class="text-3xl font-black text-[#0d1b12] tracking-tight">Order Management</h2>
                <p class="text-[#4c9a66] text-sm mt-1">Monitor and fulfill customer orders in real-time.</p>
              </div>
              <div class="flex gap-4">
                <!-- ACTIVE -->
                <div class="flex items-center gap-4 bg-white px-5 py-2.5 rounded-2xl border border-gray-200 shadow-sm min-w-[140px]">
                  <div class="w-10 h-10 rounded-xl bg-blue-50/80 flex items-center justify-center text-blue-600">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M4 2v20l2-1 2 1 2-1 2 1 2-1 2 1 2-1 2 1V2l-2 1-2-1-2 1-2-1-2 1-2-1-2 1Z"/><path d="M16 8h-6a2 2 0 1 0 0 4h4a2 2 0 1 1 0 4H8"/><path d="M12 17.5v-11"/></svg>
                  </div>
                  <div class="flex flex-col">
                    <span class="text-[11px] text-[#2d8779] font-semibold uppercase tracking-wider">Active</span>
                    <span class="text-xl font-black text-[#0d1b12] leading-none mt-0.5">${orderList != null ? orderList.size() : '0'}</span>
                  </div>
                </div>

                <!-- PREPARING -->
                <div class="flex items-center gap-4 bg-white px-5 py-2.5 rounded-2xl border border-gray-200 shadow-sm min-w-[140px]">
                  <div class="w-10 h-10 rounded-xl bg-orange-50/80 flex items-center justify-center text-[#c88d3e]">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M17 8h1a4 4 0 1 1 0 8h-1"/><path d="M3 8h14v9a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4Z"/><line x1="6" x2="6" y1="2" y2="4"/><line x1="10" x2="10" y1="2" y2="4"/><line x1="14" x2="14" y1="2" y2="4"/></svg>
                  </div>
                  <div class="flex flex-col">
                    <span class="text-[11px] text-[#2d8779] font-semibold uppercase tracking-wider">Preparing</span>
                    <span class="text-xl font-black text-[#0d1b12] leading-none mt-0.5">${orderBar != null ? orderBar.preparing : '0'}</span>
                  </div>
                </div>

                <!-- COMPLETED -->
                <div class="flex items-center gap-4 bg-white px-5 py-2.5 rounded-2xl border border-gray-200 shadow-sm min-w-[140px]">
                  <div class="w-10 h-10 rounded-xl bg-[#ecf7f1] flex items-center justify-center text-[#189b53]">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><path d="m9 11 3 3L22 4"/></svg>
                  </div>
                  <div class="flex flex-col">
                    <span class="text-[11px] text-[#2d8779] font-semibold uppercase tracking-wider">Completed</span>
                    <span class="text-xl font-black text-[#0d1b12] leading-none mt-0.5">${orderBar != null ? orderBar.completed : '0'}</span>
                  </div>
                </div>
              </div>
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
                    id="searchInput"
                    placeholder="Search order ID, customer name..."
                    class="w-full pl-10 pr-4 py-2.5 bg-[#f6f8f6] border border-transparent focus:border-[#13ec5b] focus:ring-0 rounded-lg text-sm text-[#0d1b12] placeholder:text-[#4c9a66] transition-all outline-none"
                  />
                </div>
                <div class="flex gap-2 overflow-x-auto w-full md:w-auto pb-1 md:pb-0" id="statusFilters">
                  <button data-filter="All" class="filter-btn active shrink-0 h-9 px-4 rounded-lg bg-[#0d1b12] text-white text-sm font-medium transition-colors border border-transparent">All Orders</button>
                  <button data-filter="Preparing" class="filter-btn shrink-0 h-9 px-4 rounded-lg bg-[#f6f8f6] text-[#0d1b12] hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Preparing</button>
                  <button data-filter="Ready for Pickup" class="filter-btn shrink-0 h-9 px-4 rounded-lg bg-[#f6f8f6] text-[#0d1b12] hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Ready</button>
                  <button data-filter="Completed" class="filter-btn shrink-0 h-9 px-4 rounded-lg bg-[#f6f8f6] text-[#0d1b12] hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Completed</button>
                </div>
              </div>

              <div class="bg-white rounded-xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col">
                <div class="overflow-x-auto">
                  <table class="w-full text-left border-collapse">
                    <thead>
                      <tr class="bg-[#f6f8f6] border-b border-[#cfe7d7]">
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-32">Order No</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-48">Customer</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider">Order Details</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-32">Time</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-32">Pickup</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider text-center w-36">Status</th>
                      </tr>
                    </thead>
                    <tbody class="divide-y divide-[#cfe7d7]">
                      <c:forEach var="order" items="${orderList}">
                          <tr class="group hover:bg-green-50/50 transition-colors">
                            <td class="px-6 py-4"><span class="text-sm font-mono text-gray-600">${order.orderNo}</span></td>
                            <td class="px-6 py-4">
                              <div class="flex items-center gap-3">
                                <div class="h-8 w-8 rounded-full bg-[#13ec5b]/20 text-green-800 flex items-center justify-center text-xs font-bold uppercase">
                                  ${order.customerName.substring(0, 2)}
                                </div>
                                <div class="flex flex-col">
                                  <span class="text-sm font-semibold text-[#0d1b12]">${order.customerName}</span>
                                </div>
                              </div>
                            </td>
                            <td class="px-6 py-4">
                              <div class="flex flex-col gap-1">
                                <c:forEach var="item" items="${order.items}">
                                    <span class="text-sm text-gray-700">${item.quantity}x ${item.beverageName} <span class="text-xs text-gray-500">(${item.description})</span></span>
                                </c:forEach>
                              </div>
                            </td>
                            <td class="px-6 py-4"><span class="text-sm text-gray-600">${order.orderTime}</span></td>
                            <td class="px-6 py-4"><span class="text-sm font-bold text-[#0d1b12]">${order.pickupCode}</span></td>
                            <td class="px-6 py-4 text-center">
                              <c:choose>
                                  <c:when test="${order.status == 'Preparing'}">
                                      <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                                        <span class="w-1.5 h-1.5 rounded-full bg-yellow-500 mr-1.5 animate-pulse"></span>${order.status}
                                      </span>
                                  </c:when>
                                  <c:when test="${order.status == 'Ready for Pickup'}">
                                      <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                        ${order.status}
                                      </span>
                                  </c:when>
                                  <c:otherwise>
                                      <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                        ${order.status}
                                      </span>
                                  </c:otherwise>
                              </c:choose>
                            </td>
                          </tr>
                      </c:forEach>
                      <c:if test="${empty orderList}">
                          <tr class="empty-row">
                             <td colspan="6" class="px-6 py-8 text-center text-gray-500">No orders found.</td>
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

    <script>
      document.addEventListener('DOMContentLoaded', () => {
        const buttons = document.querySelectorAll('.filter-btn');
        const rows = document.querySelectorAll('tbody tr:not(.empty-row)');
        const emptyRow = document.querySelector('.empty-row');

        buttons.forEach(btn => {
          btn.addEventListener('click', () => {
            // Update active state
            buttons.forEach(b => {
              b.classList.remove('bg-[#0d1b12]', 'text-white');
              b.classList.add('bg-[#f6f8f6]', 'text-[#0d1b12]');
            });
            btn.classList.remove('bg-[#f6f8f6]', 'text-[#0d1b12]');
            btn.classList.add('bg-[#0d1b12]', 'text-white');

            const filterValue = btn.getAttribute('data-filter');
            let visibleCount = 0;

            rows.forEach(row => {
              const statusCell = row.querySelector('td:last-child').textContent.trim();
              if (filterValue === 'All' || statusCell.includes(filterValue)) {
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
        });
        
        const searchInput = document.getElementById('searchInput');
        if (searchInput) {
          searchInput.addEventListener('input', (e) => {
             const term = e.target.value.toLowerCase();
             let visibleCount = 0;
             rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(term)) {
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
    </script>
</body>
</html>
