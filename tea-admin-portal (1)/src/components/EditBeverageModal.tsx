import { X } from 'lucide-react';

interface EditBeverageModalProps {
  isOpen: boolean;
  onClose: () => void;
  beverage: any; // We'll use any for now, or define a type
}

export function EditBeverageModal({ isOpen, onClose, beverage }: EditBeverageModalProps) {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm">
      <div className="bg-white rounded-2xl shadow-xl w-full max-w-2xl overflow-hidden flex flex-col max-h-[90vh]">
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between sticky top-0 bg-white z-10">
          <h3 className="text-xl font-bold text-deep-oolong">Edit Beverage</h3>
          <button 
            onClick={onClose}
            className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>
        
        <div className="p-6 overflow-y-auto flex-1">
          <form className="flex flex-col gap-6">
            <div className="flex gap-6">
              <div className="w-32 h-32 rounded-xl bg-gray-100 border-2 border-dashed border-gray-200 flex items-center justify-center shrink-0 overflow-hidden relative group cursor-pointer">
                {beverage?.image ? (
                  <>
                    <img src={beverage.image} alt={beverage.name} className="w-full h-full object-cover" referrerPolicy="no-referrer" />
                    <div className="absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                      <span className="text-white text-xs font-medium">Change Image</span>
                    </div>
                  </>
                ) : (
                  <span className="text-gray-400 text-xs font-medium">Upload Image</span>
                )}
              </div>
              
              <div className="flex-1 flex flex-col gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Beverage Name</label>
                  <input 
                    type="text" 
                    defaultValue={beverage?.name}
                    className="w-full px-4 py-2 bg-white border border-gray-200 focus:border-primary focus:ring-1 focus:ring-primary rounded-lg text-sm text-deep-oolong outline-none transition-all"
                  />
                </div>
                <div className="flex gap-4">
                  <div className="flex-1">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Category</label>
                    <select 
                      defaultValue={beverage?.category}
                      className="w-full px-4 py-2 bg-white border border-gray-200 focus:border-primary focus:ring-1 focus:ring-primary rounded-lg text-sm text-deep-oolong outline-none transition-all appearance-none"
                    >
                      <option value="Milk Tea">Milk Tea</option>
                      <option value="Fruit Tea">Fruit Tea</option>
                      <option value="Specialty">Specialty</option>
                      <option value="Classic Tea">Classic Tea</option>
                    </select>
                  </div>
                  <div className="flex-1">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Price ($)</label>
                    <input 
                      type="text" 
                      defaultValue={beverage?.price}
                      className="w-full px-4 py-2 bg-white border border-gray-200 focus:border-primary focus:ring-1 focus:ring-primary rounded-lg text-sm text-deep-oolong outline-none transition-all"
                    />
                  </div>
                </div>
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Description</label>
              <textarea 
                rows={3}
                defaultValue={beverage?.description}
                className="w-full px-4 py-2 bg-white border border-gray-200 focus:border-primary focus:ring-1 focus:ring-primary rounded-lg text-sm text-deep-oolong outline-none transition-all resize-none"
                placeholder="Enter beverage description..."
              ></textarea>
            </div>

            <div className="border-t border-gray-100 pt-6">
              <h4 className="text-sm font-bold text-gray-900 mb-4">Options & Customization</h4>
              <div className="flex flex-col gap-4">
                <label className="flex items-center justify-between p-4 rounded-xl border border-gray-200 hover:border-primary/50 cursor-pointer transition-colors">
                  <div className="flex flex-col">
                    <span className="text-sm font-bold text-gray-900">Has Ice Option</span>
                    <span className="text-xs text-gray-500">Allow customers to customize ice level</span>
                  </div>
                  <div className="relative inline-flex items-center cursor-pointer">
                    <input type="checkbox" className="sr-only peer" defaultChecked={beverage?.hasIce} />
                    <div className="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
                  </div>
                </label>
                
                <label className="flex items-center justify-between p-4 rounded-xl border border-gray-200 hover:border-primary/50 cursor-pointer transition-colors">
                  <div className="flex flex-col">
                    <span className="text-sm font-bold text-gray-900">Has Hot Option</span>
                    <span className="text-xs text-gray-500">Available as a hot beverage</span>
                  </div>
                  <div className="relative inline-flex items-center cursor-pointer">
                    <input type="checkbox" className="sr-only peer" defaultChecked={beverage?.hasHot} />
                    <div className="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
                  </div>
                </label>
              </div>
            </div>
          </form>
        </div>
        
        <div className="px-6 py-4 border-t border-gray-100 flex items-center justify-end gap-3 bg-gray-50 sticky bottom-0">
          <button 
            onClick={onClose}
            className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
          >
            Cancel
          </button>
          <button 
            onClick={onClose}
            className="px-4 py-2 text-sm font-medium text-white bg-primary rounded-lg hover:bg-primary-dark transition-colors shadow-sm"
          >
            Save Changes
          </button>
        </div>
      </div>
    </div>
  );
}
