import { Search, Receipt, Soup, CheckCircle2, Eye, Check } from 'lucide-react';

export function Orders() {
  return (
    <div className="flex-1 flex flex-col h-full overflow-hidden relative">
      <header className="bg-background-light px-8 py-6 shrink-0 z-10">
        <div className="max-w-[1400px] mx-auto flex flex-col md:flex-row md:justify-between md:items-center gap-6">
          <div>
            <h2 className="text-3xl font-black text-deep-oolong tracking-tight">Order Management</h2>
            <p className="text-muted-green text-sm mt-1">Monitor and fulfill customer orders in real-time.</p>
          </div>
          <div className="flex gap-4">
            <div className="flex items-center gap-3 bg-white px-4 py-2.5 rounded-xl border border-[#cfe7d7] shadow-sm">
              <div className="w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center text-blue-600">
                <Receipt className="w-5 h-5" />
              </div>
              <div className="flex flex-col">
                <span className="text-xs text-muted-green font-medium uppercase tracking-wide">Active</span>
                <span className="text-lg font-bold text-deep-oolong">12</span>
              </div>
            </div>
            <div className="flex items-center gap-3 bg-white px-4 py-2.5 rounded-xl border border-[#cfe7d7] shadow-sm">
              <div className="w-10 h-10 rounded-lg bg-yellow-50 flex items-center justify-center text-yellow-600">
                <Soup className="w-5 h-5" />
              </div>
              <div className="flex flex-col">
                <span className="text-xs text-muted-green font-medium uppercase tracking-wide">Preparing</span>
                <span className="text-lg font-bold text-deep-oolong">5</span>
              </div>
            </div>
            <div className="flex items-center gap-3 bg-white px-4 py-2.5 rounded-xl border border-[#cfe7d7] shadow-sm">
              <div className="w-10 h-10 rounded-lg bg-green-50 flex items-center justify-center text-green-600">
                <CheckCircle2 className="w-5 h-5" />
              </div>
              <div className="flex flex-col">
                <span className="text-xs text-muted-green font-medium uppercase tracking-wide">Completed</span>
                <span className="text-lg font-bold text-deep-oolong">128</span>
              </div>
            </div>
          </div>
        </div>
      </header>

      <div className="flex-1 overflow-y-auto px-8 pb-8">
        <div className="max-w-[1400px] mx-auto flex flex-col gap-6">
          <div className="bg-white rounded-xl p-4 shadow-sm border border-[#cfe7d7] flex flex-col md:flex-row gap-4 justify-between items-center">
            <div className="relative w-full md:w-96">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-green w-5 h-5" />
              <input 
                type="text" 
                placeholder="Search order ID, customer name..." 
                className="w-full pl-10 pr-4 py-2.5 bg-background-light border border-transparent focus:border-primary focus:ring-0 rounded-lg text-sm text-deep-oolong placeholder:text-muted-green transition-all outline-none"
              />
            </div>
            <div className="flex gap-2 overflow-x-auto w-full md:w-auto pb-1 md:pb-0">
              <button className="shrink-0 h-9 px-4 rounded-lg bg-deep-oolong text-white text-sm font-medium transition-colors">All Orders</button>
              <button className="shrink-0 h-9 px-4 rounded-lg bg-background-light text-deep-oolong hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Pending</button>
              <button className="shrink-0 h-9 px-4 rounded-lg bg-background-light text-deep-oolong hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Processing</button>
              <button className="shrink-0 h-9 px-4 rounded-lg bg-background-light text-deep-oolong hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Completed</button>
            </div>
          </div>

          <div className="bg-white rounded-xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col">
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-background-light border-b border-[#cfe7d7]">
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-32">Order No</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-48">Customer</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider">Order Details</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-32">Time</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-32">Total Price</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider text-center w-36">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-[#cfe7d7]">
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">#ORD-0245</span></td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="h-8 w-8 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center text-xs font-bold">AL</div>
                        <div className="flex flex-col">
                          <span className="text-sm font-semibold text-deep-oolong">Alice Liu</span>
                          <span className="text-xs text-gray-500">Member</span>
                        </div>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col gap-1">
                        <span className="text-sm text-gray-700">2x Matcha Latte (Large, 50% Sugar)</span>
                        <span className="text-sm text-gray-700">1x Taro Milk Tea (Regular, Pudding)</span>
                      </div>
                    </td>
                    <td className="px-6 py-4"><span className="text-sm text-gray-600">10:45 AM</span></td>
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">$18.50</span></td>
                    <td className="px-6 py-4 text-center">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                        <span className="w-1.5 h-1.5 rounded-full bg-blue-500 mr-1.5 animate-pulse"></span>
                        New Order
                      </span>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">#ORD-0244</span></td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="h-8 w-8 rounded-full bg-orange-100 text-orange-700 flex items-center justify-center text-xs font-bold">MK</div>
                        <div className="flex flex-col">
                          <span className="text-sm font-semibold text-deep-oolong">Michael K.</span>
                          <span className="text-xs text-gray-500">Guest</span>
                        </div>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col gap-1">
                        <span className="text-sm text-gray-700">1x Brown Sugar Pearl Milk (Regular)</span>
                      </div>
                    </td>
                    <td className="px-6 py-4"><span className="text-sm text-gray-600">10:42 AM</span></td>
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">$6.00</span></td>
                    <td className="px-6 py-4 text-center">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                        <span className="w-1.5 h-1.5 rounded-full bg-yellow-500 mr-1.5 animate-pulse"></span>
                        Preparing
                      </span>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">#ORD-0243</span></td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="h-8 w-8 rounded-full bg-purple-100 text-purple-700 flex items-center justify-center text-xs font-bold">SJ</div>
                        <div className="flex flex-col">
                          <span className="text-sm font-semibold text-deep-oolong">Sarah Jenkins</span>
                          <span className="text-xs text-gray-500">Member</span>
                        </div>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col gap-1">
                        <span className="text-sm text-gray-700">3x Passion Fruit GT (Large, Less Ice)</span>
                        <span className="text-sm text-gray-700">1x Oolong Pure (Hot)</span>
                      </div>
                    </td>
                    <td className="px-6 py-4"><span className="text-sm text-gray-600">10:30 AM</span></td>
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">$24.50</span></td>
                    <td className="px-6 py-4 text-center">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                        <span className="w-1.5 h-1.5 rounded-full bg-yellow-500 mr-1.5 animate-pulse"></span>
                        Preparing
                      </span>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">#ORD-0242</span></td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="h-8 w-8 rounded-full bg-indigo-100 text-indigo-700 flex items-center justify-center text-xs font-bold">JD</div>
                        <div className="flex flex-col">
                          <span className="text-sm font-semibold text-deep-oolong">John Doe</span>
                          <span className="text-xs text-gray-500">Guest</span>
                        </div>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col gap-1">
                        <span className="text-sm text-gray-700">2x Jasmine Milk Tea (Regular, 70% Sugar)</span>
                      </div>
                    </td>
                    <td className="px-6 py-4"><span className="text-sm text-gray-600">10:15 AM</span></td>
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">$11.00</span></td>
                    <td className="px-6 py-4 text-center">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">
                        Ready for Pickup
                      </span>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors opacity-75">
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">#ORD-0241</span></td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="h-8 w-8 rounded-full bg-pink-100 text-pink-700 flex items-center justify-center text-xs font-bold">EM</div>
                        <div className="flex flex-col">
                          <span className="text-sm font-semibold text-deep-oolong">Emily M.</span>
                          <span className="text-xs text-gray-500">Member</span>
                        </div>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col gap-1">
                        <span className="text-sm text-gray-700">1x Mango Slush (Large)</span>
                        <span className="text-sm text-gray-700">1x Strawberry Green Tea</span>
                      </div>
                    </td>
                    <td className="px-6 py-4"><span className="text-sm text-gray-600">10:05 AM</span></td>
                    <td className="px-6 py-4"><span className="text-sm font-bold text-deep-oolong">$13.25</span></td>
                    <td className="px-6 py-4 text-center">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-600">
                        Completed
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div className="bg-white px-6 py-4 border-t border-[#cfe7d7] flex items-center justify-between">
              <span className="text-sm text-gray-500">Showing <span className="font-medium text-deep-oolong">1</span> to <span className="font-medium text-deep-oolong">5</span> of <span className="font-medium text-deep-oolong">24</span> active orders</span>
              <div className="flex items-center gap-2">
                <button className="px-3 py-1.5 rounded border border-gray-200 text-sm text-gray-500 hover:bg-gray-50 disabled:opacity-50">Previous</button>
                <button className="px-3 py-1.5 rounded border border-gray-200 text-sm text-gray-500 hover:bg-gray-50">Next</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
