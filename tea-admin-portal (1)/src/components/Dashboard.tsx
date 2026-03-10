import { Search, Bell, TrendingUp, TrendingDown, Clock, ShoppingBag, FileText, Download, MoreHorizontal, Package } from 'lucide-react';

export function Dashboard() {
  return (
    <div className="flex-1 h-full overflow-y-auto bg-gray-50/50">
      <header className="bg-white border-b border-gray-200 sticky top-0 z-40 px-8 h-20 flex items-center justify-between shadow-sm">
        <div>
          <h2 className="text-xl font-bold text-gray-900">Dashboard</h2>
          <p className="text-sm text-gray-500 mt-0.5">Overview of your store performance</p>
        </div>
        <div className="flex items-center gap-4">
          <div className="relative w-72 hidden md:block">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 w-5 h-5" />
            <input 
              type="text" 
              placeholder="Search..." 
              className="w-full pl-10 pr-4 py-2 bg-gray-100 border-none rounded-lg text-sm focus:ring-2 focus:ring-matcha/20 text-gray-700 placeholder-gray-500 outline-none"
            />
          </div>
          <button className="relative p-2 rounded-full text-gray-500 hover:bg-gray-100 transition-colors">
            <Bell className="w-5 h-5" />
            <span className="absolute top-2 right-2 w-2 h-2 bg-red-500 rounded-full border-2 border-white"></span>
          </button>
        </div>
      </header>

      <div className="p-8 max-w-[1600px] mx-auto flex flex-col gap-8">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-white p-6 rounded-xl border border-gray-200 flex flex-col justify-between h-32 shadow-sm">
            <div className="flex items-start justify-between">
              <div className="flex flex-col">
                <span className="text-sm font-medium text-gray-500">Total Revenue</span>
                <h3 className="text-2xl font-bold text-gray-900 mt-1">$1,240.50</h3>
              </div>
              <div className="p-2 bg-green-50 rounded-lg text-green-600">
                <FileText className="w-5 h-5" />
              </div>
            </div>
            <div className="flex items-center gap-2 mt-auto">
              <span className="flex items-center text-xs font-semibold text-green-600">
                <TrendingUp className="w-3 h-3 mr-0.5" /> 12.5%
              </span>
              <span className="text-xs text-gray-400">vs last week</span>
            </div>
          </div>

          <div className="bg-white p-6 rounded-xl border border-gray-200 flex flex-col justify-between h-32 shadow-sm">
            <div className="flex items-start justify-between">
              <div className="flex flex-col">
                <span className="text-sm font-medium text-gray-500">Pending Orders</span>
                <h3 className="text-2xl font-bold text-gray-900 mt-1">12</h3>
              </div>
              <div className="p-2 bg-orange-50 rounded-lg text-orange-600">
                <Clock className="w-5 h-5" />
              </div>
            </div>
            <div className="flex items-center gap-2 mt-auto">
              <span className="flex items-center text-xs font-semibold text-orange-600">
                <Clock className="w-3 h-3 mr-0.5" /> 2 Urgent
              </span>
              <span className="text-xs text-gray-400">needs attention</span>
            </div>
          </div>

          <div className="bg-white p-6 rounded-xl border border-gray-200 flex flex-col justify-between h-32 shadow-sm">
            <div className="flex items-start justify-between">
              <div className="flex flex-col">
                <span className="text-sm font-medium text-gray-500">Total Order Today</span>
                <h3 className="text-2xl font-bold text-gray-900 mt-1">5</h3>
              </div>
              <div className="p-2 bg-blue-50 rounded-lg text-blue-600">
                <ShoppingBag className="w-5 h-5" />
              </div>
            </div>
            <div className="flex items-center gap-2 mt-auto">
              <span className="flex items-center text-xs font-semibold text-red-500">
                <TrendingDown className="w-3 h-3 mr-0.5" /> 1.2%
              </span>
              <span className="text-xs text-gray-400">vs yesterday</span>
            </div>
          </div>
        </div>

        <div className="flex flex-col gap-5">
          <div className="flex items-center justify-between">
            <h3 className="text-lg font-bold text-gray-900 flex items-center gap-2">
              Live Incoming Orders
              <span className="px-2 py-0.5 rounded-full bg-matcha/10 text-matcha text-xs font-semibold">Live</span>
            </h3>
            <div className="flex gap-3">
              <button className="px-4 py-2 text-sm font-medium rounded-lg bg-white border border-gray-200 text-gray-700 hover:bg-gray-50 transition-colors shadow-sm">
                Filter
              </button>
              <button className="px-4 py-2 text-sm font-medium rounded-lg bg-white border border-gray-200 text-gray-700 hover:bg-gray-50 transition-colors shadow-sm">
                Export
              </button>
            </div>
          </div>

          <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-gray-50/50 border-b border-gray-200">
                    <th className="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Order ID</th>
                    <th className="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Customer</th>
                    <th className="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Items</th>
                    <th className="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Time</th>
                    <th className="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Status</th>
                    <th className="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500 text-right">Action</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  <tr className="hover:bg-gray-50 transition-colors group">
                    <td className="px-6 py-5 whitespace-nowrap">
                      <span className="font-medium text-gray-900">#1024</span>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap">
                      <div className="flex items-center gap-3">
                        <img src="https://i.pravatar.cc/150?u=alice" alt="Alice M." className="w-9 h-9 rounded-full bg-gray-200" referrerPolicy="no-referrer" />
                        <span className="text-sm font-medium text-gray-700">Alice M.</span>
                      </div>
                    </td>
                    <td className="px-6 py-5">
                      <p className="text-sm text-gray-600 truncate max-w-xs">Brown Sugar Milk Tea <span className="text-xs text-gray-400">x2</span></p>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap text-sm text-gray-500">10:45 AM</td>
                    <td className="px-6 py-5 whitespace-nowrap">
                      <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">Preparing</span>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap text-right">
                      <button className="text-sm font-medium text-matcha hover:text-green-700 transition-colors">Mark Ready</button>
                    </td>
                  </tr>
                  <tr className="hover:bg-gray-50 transition-colors group">
                    <td className="px-6 py-5 whitespace-nowrap">
                      <span className="font-medium text-gray-900">#1023</span>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap">
                      <div className="flex items-center gap-3">
                        <div className="w-9 h-9 rounded-full bg-blue-100 flex items-center justify-center text-xs font-bold text-blue-600">BD</div>
                        <span className="text-sm font-medium text-gray-700">Bob D.</span>
                      </div>
                    </td>
                    <td className="px-6 py-5">
                      <p className="text-sm text-gray-600 truncate max-w-xs">Matcha Latte</p>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap text-sm text-gray-500">10:42 AM</td>
                    <td className="px-6 py-5 whitespace-nowrap">
                      <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800">Pending</span>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap text-right">
                      <button className="inline-flex items-center justify-center px-4 py-1.5 text-xs font-bold uppercase tracking-wide text-white bg-matcha rounded-md hover:bg-green-700 transition-colors shadow-sm">Accept</button>
                    </td>
                  </tr>
                  <tr className="hover:bg-gray-50 transition-colors group">
                    <td className="px-6 py-5 whitespace-nowrap">
                      <span className="font-medium text-gray-900">#1022</span>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap">
                      <div className="flex items-center gap-3">
                        <img src="https://i.pravatar.cc/150?u=charlie" alt="Charlie" className="w-9 h-9 rounded-full bg-gray-200" referrerPolicy="no-referrer" />
                        <span className="text-sm font-medium text-gray-700">Charlie</span>
                      </div>
                    </td>
                    <td className="px-6 py-5">
                      <p className="text-sm text-gray-600 truncate max-w-xs">Oolong Tea, Pearl</p>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap text-sm text-gray-500">10:30 AM</td>
                    <td className="px-6 py-5 whitespace-nowrap">
                      <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-matcha/10 text-matcha">Ready</span>
                    </td>
                    <td className="px-6 py-5 whitespace-nowrap text-right">
                      <button className="text-sm font-medium text-gray-500 hover:text-gray-900 transition-colors">Serve</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div className="px-6 py-4 bg-white border-t border-gray-200 flex items-center justify-between">
              <p className="text-sm text-gray-500">
                Showing <span className="font-medium text-gray-900">1</span> to <span className="font-medium text-gray-900">3</span> of <span className="font-medium text-gray-900">12</span> results
              </p>
              <div className="flex items-center gap-2">
                <button className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50">Previous</button>
                <button className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-50">Next</button>
              </div>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 pb-8">
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div className="flex items-center justify-between mb-6">
              <h3 className="font-bold text-gray-900">Popular Items Today</h3>
              <a href="#" className="text-sm text-matcha font-medium hover:text-green-700">View Menu</a>
            </div>
            <div className="flex flex-col gap-4">
              <div className="flex items-center justify-between p-3 rounded-lg bg-gray-50">
                <div className="flex items-center gap-3">
                  <img src="https://images.unsplash.com/photo-1558857563-b37102e99e00?w=100&h=100&fit=crop" alt="Classic Milk Tea" className="w-10 h-10 rounded-lg object-cover" referrerPolicy="no-referrer" />
                  <div>
                    <p className="text-sm font-medium text-gray-900">Classic Milk Tea</p>
                    <p className="text-xs text-gray-500">42 Orders</p>
                  </div>
                </div>
                <span className="text-sm font-bold text-green-600">+15%</span>
              </div>
              <div className="flex items-center justify-between p-3 rounded-lg bg-gray-50">
                <div className="flex items-center gap-3">
                  <img src="https://images.unsplash.com/photo-1515823662972-da6a2e4d3002?w=100&h=100&fit=crop" alt="Matcha Latte" className="w-10 h-10 rounded-lg object-cover" referrerPolicy="no-referrer" />
                  <div>
                    <p className="text-sm font-medium text-gray-900">Matcha Latte</p>
                    <p className="text-xs text-gray-500">38 Orders</p>
                  </div>
                </div>
                <span className="text-sm font-bold text-green-600">+8%</span>
              </div>
            </div>
          </div>

          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div className="flex items-center justify-between mb-6">
              <h3 className="font-bold text-gray-900">Store Alerts</h3>
              <button className="text-gray-400 hover:text-gray-600">
                <MoreHorizontal className="w-5 h-5" />
              </button>
            </div>
            <div className="flex flex-col gap-4">
              <div className="flex items-start gap-3 p-4 rounded-lg bg-matcha/5 border border-matcha/10">
                <Package className="w-5 h-5 text-matcha mt-0.5" />
                <div>
                  <h4 className="text-sm font-bold text-gray-900">Low Stock: Tapioca Pearls</h4>
                  <p className="text-sm text-gray-600 mt-1">Inventory is below 15%. Reorder recommended by EOD.</p>
                  <button className="mt-2 text-xs font-bold text-matcha hover:underline">Restock Now</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
