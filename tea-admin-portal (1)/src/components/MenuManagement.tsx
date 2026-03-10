import { useState } from 'react';
import { Search, Plus, Edit2 } from 'lucide-react';
import { EditBeverageModal } from './EditBeverageModal';

export function MenuManagement() {
  const [isEditModalOpen, setIsEditModalOpen] = useState(false);
  const [selectedBeverage, setSelectedBeverage] = useState<any>(null);

  const handleEditClick = (beverage: any) => {
    setSelectedBeverage(beverage);
    setIsEditModalOpen(true);
  };

  return (
    <div className="flex-1 flex flex-col h-full overflow-hidden relative bg-background-light">
      <header className="px-8 py-6 shrink-0 z-10">
        <div className="max-w-[1400px] mx-auto flex flex-col md:flex-row md:justify-between md:items-center gap-6">
          <div>
            <h2 className="text-3xl font-black text-deep-oolong tracking-tight">Menu Management</h2>
            <p className="text-muted-green text-sm mt-1">Manage your drinks, prices, and availability.</p>
          </div>
          <button className="flex items-center gap-2 bg-primary text-green-900 font-bold px-4 py-2.5 rounded-lg hover:bg-primary-dark transition-colors shadow-sm">
            <Plus className="w-5 h-5" />
            Add New Item
          </button>
        </div>
      </header>

      <div className="flex-1 overflow-y-auto px-8 pb-8">
        <div className="max-w-[1400px] mx-auto flex flex-col gap-6">
          <div className="bg-white rounded-xl p-4 shadow-sm border border-[#cfe7d7] flex flex-col md:flex-row gap-4 justify-between items-center">
            <div className="relative w-full md:w-96">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-green w-5 h-5" />
              <input 
                type="text" 
                placeholder="Search for drinks, ingredients..." 
                className="w-full pl-10 pr-4 py-2.5 bg-background-light border border-transparent focus:border-primary focus:ring-0 rounded-lg text-sm text-deep-oolong placeholder:text-muted-green transition-all outline-none"
              />
            </div>
            <div className="flex gap-2 overflow-x-auto w-full md:w-auto pb-1 md:pb-0">
              <button className="shrink-0 h-9 px-4 rounded-lg bg-deep-oolong text-white text-sm font-medium transition-colors">All Items</button>
              <button className="shrink-0 h-9 px-4 rounded-lg bg-background-light text-deep-oolong hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Milk Teas</button>
              <button className="shrink-0 h-9 px-4 rounded-lg bg-background-light text-deep-oolong hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Fruit Teas</button>
              <button className="shrink-0 h-9 px-4 rounded-lg bg-background-light text-deep-oolong hover:bg-green-100 text-sm font-medium transition-colors border border-transparent hover:border-green-200">Toppings</button>
            </div>
          </div>

          <div className="bg-white rounded-xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col">
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-background-light border-b border-[#cfe7d7]">
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-24">Image</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider">Item Name</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-64">Description</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-32">Category</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-24">Price</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-24">Code</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-24">Ice Option</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-24">Hot Option</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider w-24">Status</th>
                    <th className="px-6 py-4 text-xs font-semibold text-muted-green uppercase tracking-wider text-right w-24"></th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-[#cfe7d7]">
                  <tr className="group hover:bg-green-50/50 transition-colors relative">
                    <td className="px-6 py-4">
                      <img src="https://images.unsplash.com/photo-1515823662972-da6a2e4d3002?w=100&h=100&fit=crop" alt="Matcha Latte" className="w-12 h-12 rounded-lg object-cover" referrerPolicy="no-referrer" />
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-bold text-deep-oolong">Matcha Latte</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-xs text-gray-500 line-clamp-2">Premium matcha powder blended with creamy milk.</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">Milk Tea</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-medium text-gray-700">$5.50</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-mono text-gray-500">#DRK-001</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">Yes</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">Yes</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-primary rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-500">In Stock</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-right">
                      <button 
                        onClick={() => handleEditClick({
                          name: 'Matcha Latte',
                          description: 'Premium matcha powder blended with creamy milk.',
                          category: 'Milk Tea',
                          price: '5.50',
                          hasIce: true,
                          hasHot: true,
                          image: 'https://images.unsplash.com/photo-1515823662972-da6a2e4d3002?w=100&h=100&fit=crop'
                        })}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-2 rounded-lg bg-white border border-gray-200 text-gray-600 hover:text-primary hover:border-primary shadow-sm"
                      >
                        <Edit2 className="w-4 h-4" />
                      </button>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors relative">
                    <td className="px-6 py-4">
                      <img src="https://images.unsplash.com/photo-1558857563-b37102e99e00?w=100&h=100&fit=crop" alt="Brown Sugar Pearl" className="w-12 h-12 rounded-lg object-cover" referrerPolicy="no-referrer" />
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-bold text-deep-oolong">Brown Sugar Pearl</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-xs text-gray-500 line-clamp-2">Signature brown sugar syrup with fresh milk and boba.</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-orange-100 text-orange-800">Specialty</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-medium text-gray-700">$6.00</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-mono text-gray-500">#DRK-002</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">Yes</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">Yes</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-primary rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-500">In Stock</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-right">
                      <button 
                        onClick={() => handleEditClick({
                          name: 'Brown Sugar Pearl',
                          description: 'Signature brown sugar syrup with fresh milk and boba.',
                          category: 'Specialty',
                          price: '6.00',
                          hasIce: true,
                          hasHot: true,
                          image: 'https://images.unsplash.com/photo-1558857563-b37102e99e00?w=100&h=100&fit=crop'
                        })}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-2 rounded-lg bg-white border border-gray-200 text-gray-600 hover:text-primary hover:border-primary shadow-sm"
                      >
                        <Edit2 className="w-4 h-4" />
                      </button>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors relative">
                    <td className="px-6 py-4">
                      <img src="https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=100&h=100&fit=crop" alt="Oolong Pure" className="w-12 h-12 rounded-lg object-cover" referrerPolicy="no-referrer" />
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-bold text-deep-oolong">Oolong Pure</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-xs text-gray-500 line-clamp-2">Roasted oolong tea with a smooth, earthy finish.</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">Classic Tea</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-medium text-gray-700">$4.25</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-mono text-gray-500">#DRK-003</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">No</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">Yes</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-gray-200 rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 left-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-400">Out of Stock</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-right">
                      <button 
                        onClick={() => handleEditClick({
                          name: 'Oolong Pure',
                          description: 'Roasted oolong tea with a smooth, earthy finish.',
                          category: 'Classic Tea',
                          price: '4.25',
                          hasIce: false,
                          hasHot: true,
                          image: 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=100&h=100&fit=crop'
                        })}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-2 rounded-lg bg-white border border-gray-200 text-gray-600 hover:text-primary hover:border-primary shadow-sm"
                      >
                        <Edit2 className="w-4 h-4" />
                      </button>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors relative">
                    <td className="px-6 py-4">
                      <img src="https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=100&h=100&fit=crop" alt="Taro Milk Tea" className="w-12 h-12 rounded-lg object-cover" referrerPolicy="no-referrer" />
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-bold text-deep-oolong">Taro Milk Tea</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-xs text-gray-500 line-clamp-2">Sweet taro root blended with milk and classic tea.</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">Milk Tea</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-medium text-gray-700">$5.75</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-mono text-gray-500">#DRK-004</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">Yes</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">No</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-primary rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-500">In Stock</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-right">
                      <button 
                        onClick={() => handleEditClick({
                          name: 'Taro Milk Tea',
                          description: 'Sweet taro root blended with milk and classic tea.',
                          category: 'Milk Tea',
                          price: '5.75',
                          hasIce: true,
                          hasHot: false,
                          image: 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=100&h=100&fit=crop'
                        })}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-2 rounded-lg bg-white border border-gray-200 text-gray-600 hover:text-primary hover:border-primary shadow-sm"
                      >
                        <Edit2 className="w-4 h-4" />
                      </button>
                    </td>
                  </tr>
                  <tr className="group hover:bg-green-50/50 transition-colors relative">
                    <td className="px-6 py-4">
                      <img src="https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=100&h=100&fit=crop" alt="Passion Fruit GT" className="w-12 h-12 rounded-lg object-cover" referrerPolicy="no-referrer" />
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-bold text-deep-oolong">Passion Fruit GT</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-xs text-gray-500 line-clamp-2">Refreshing green tea with real passion fruit pulp.</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800">Fruit Tea</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-medium text-gray-700">$5.00</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm font-mono text-gray-500">#DRK-005</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">Yes</span>
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-gray-600">No</span>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex flex-col items-start gap-1">
                        <div className="w-11 h-6 bg-primary rounded-full relative cursor-pointer">
                          <div className="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                        </div>
                        <span className="text-[10px] text-gray-500">In Stock</span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-right">
                      <button 
                        onClick={() => handleEditClick({
                          name: 'Passion Fruit GT',
                          description: 'Refreshing green tea with real passion fruit pulp.',
                          category: 'Fruit Tea',
                          price: '5.00',
                          hasIce: true,
                          hasHot: false,
                          image: 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=100&h=100&fit=crop'
                        })}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-2 rounded-lg bg-white border border-gray-200 text-gray-600 hover:text-primary hover:border-primary shadow-sm"
                      >
                        <Edit2 className="w-4 h-4" />
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div className="bg-white px-6 py-4 border-t border-[#cfe7d7] flex items-center justify-between">
              <span className="text-sm text-gray-500">Showing <span className="font-medium text-deep-oolong">1</span> to <span className="font-medium text-deep-oolong">10</span> of <span className="font-medium text-deep-oolong">45</span> results</span>
              <div className="flex items-center gap-2">
                <button className="px-3 py-1.5 rounded border border-gray-200 text-sm text-gray-500 hover:bg-gray-50 disabled:opacity-50">Previous</button>
                <button className="px-3 py-1.5 rounded border border-gray-200 text-sm text-gray-500 hover:bg-gray-50">Next</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <EditBeverageModal 
        isOpen={isEditModalOpen} 
        onClose={() => setIsEditModalOpen(false)} 
        beverage={selectedBeverage} 
      />
    </div>
  );
}
