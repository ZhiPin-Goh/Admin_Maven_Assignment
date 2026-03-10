import { Search, Filter, Eye, MessageSquare } from 'lucide-react';

export function Customers() {
  return (
    <div className="flex-1 flex flex-col h-full overflow-hidden relative bg-background-light">
      <header className="px-8 py-6 shrink-0 z-10">
        <div className="max-w-[1400px] mx-auto flex flex-col md:flex-row md:justify-between md:items-center gap-6">
          <div>
            <h2 className="text-3xl font-black text-deep-oolong tracking-tight">Customer List</h2>
            <p className="text-muted-green text-sm mt-1">Manage your members and tea enthusiasts.</p>
          </div>
          <div className="flex gap-4">
            <div className="relative w-full md:w-72">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-green w-5 h-5" />
              <input 
                type="text" 
                placeholder="Search customers..." 
                className="w-full pl-10 pr-4 py-2.5 bg-white border border-gray-200 focus:border-primary focus:ring-0 rounded-lg text-sm text-deep-oolong placeholder:text-muted-green transition-all outline-none"
              />
            </div>
            <button className="flex items-center gap-2 bg-white border border-gray-200 text-gray-700 px-4 py-2.5 rounded-lg hover:bg-gray-50 transition-colors shadow-sm text-sm font-medium">
              <Filter className="w-4 h-4" />
              All Members
            </button>
          </div>
        </div>
      </header>

      <div className="flex-1 overflow-y-auto px-8 pb-8">
        <div className="max-w-[1400px] mx-auto">
          <div className="bg-white rounded-xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col">
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-background-light border-b border-[#cfe7d7]">
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider">Customer</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider">Email</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider">Phone Number</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider">Usercode</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-48">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-[#cfe7d7]">
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <img src="https://i.pravatar.cc/150?u=alice" alt="Alice Freeman" className="w-10 h-10 rounded-full bg-gray-200" referrerPolicy="no-referrer" />
                        <span className="text-sm font-bold text-deep-oolong">Alice Freeman</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-600">alice.free@example.com</td>
                    <td className="px-6 py-4 text-sm text-gray-600">+1 (555) 123-4567</td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-gray-100 text-gray-800 font-mono">USR-8921</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-primary rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-500">Active</span>
                      </div>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <img src="https://i.pravatar.cc/150?u=marcus" alt="Marcus Johnson" className="w-10 h-10 rounded-full bg-gray-200" referrerPolicy="no-referrer" />
                        <span className="text-sm font-bold text-deep-oolong">Marcus Johnson</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-600">marcus.j@example.com</td>
                    <td className="px-6 py-4 text-sm text-gray-600">+1 (555) 987-6543</td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-gray-100 text-gray-800 font-mono">USR-3422</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-primary rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-500">Active</span>
                      </div>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <img src="https://i.pravatar.cc/150?u=sarah" alt="Sarah Connor" className="w-10 h-10 rounded-full bg-gray-200" referrerPolicy="no-referrer" />
                        <span className="text-sm font-bold text-deep-oolong">Sarah Connor</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-600">s.connor@sky.net</td>
                    <td className="px-6 py-4 text-sm text-gray-600">+1 (555) 456-7890</td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-gray-100 text-gray-800 font-mono">USR-1109</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-gray-200 rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 left-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-400">Inactive</span>
                      </div>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <img src="https://i.pravatar.cc/150?u=david" alt="David Chen" className="w-10 h-10 rounded-full bg-gray-200" referrerPolicy="no-referrer" />
                        <span className="text-sm font-bold text-deep-oolong">David Chen</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-600">d.chen@example.com</td>
                    <td className="px-6 py-4 text-sm text-gray-600">+1 (555) 222-3333</td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-gray-100 text-gray-800 font-mono">USR-9943</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-primary rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-500">Active</span>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div className="bg-white px-6 py-4 border-t border-[#cfe7d7] flex items-center justify-between">
              <span className="text-sm text-gray-500">Showing 1 to 4 of 28 results</span>
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
