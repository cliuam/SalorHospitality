# coding: UTF-8

# Copyright (c) 2012 Red (E) Tools Ltd.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

class Report
  def dump_all(from,to,device)
    tfrom = from.strftime("%Y%m%d")
    tto = to.strftime("%Y%m%d")
    from = from.strftime("%Y-%m-%d 01:00:00")
    to = to.strftime("%Y-%m-%d 23:59:59")
    @orders = Order.where(["(created_at BETWEEN ? AND ?) OR (updated_at BETWEEN ? AND ?)",from,to,from,to]).order("created_at DESC")
    @items = Article.where(["(created_at BETWEEN ? AND ?) OR (updated_at BETWEEN ? AND ?)",from,to,from,to]).order("created_at DESC")
    @histories = History.where(["(created_at BETWEEN ? AND ?) OR (updated_at BETWEEN ? AND ?)",from,to,from,to]).order("created_at DESC")
    @receipts = Receipt.where(["(created_at BETWEEN ? AND ?) OR (updated_at BETWEEN ? AND ?)",from,to,from,to]).order("created_at DESC")

    File.open("#{device}/SalorHospitalityOrders#{tfrom}-#{tto}.tsv","w") do |f|
      f.write(orders_csv(@orders))
    end
    File.open("#{device}/SalorHospitalityItems#{tfrom}-#{tto}.tsv","w") do |f|
      f.write(items_csv(@items))
    end
    File.open("#{device}/SalorHospitalityHistory#{tfrom}-#{tto}.tsv","w") do |f|
      f.write(history_csv(@histories))
    end
    File.open("#{device}/SalorHospitalityReceipts#{tfrom}-#{tto}.txt","w") do |f|
      @receipts.each do |r|
        f.write("\n---\n#{r.created_at}\n#{r.user.login}\n---\n\n")
        f.write r.content
      end
    end
  end
  def history_csv(histories)
   cols = [:created_at,:ip, :action_taken, :model_type,:model_id, :user_id,:sensitivity,:url] 
   lines = []
   lines << cols.join("\t")
   histories.each do |h|
    line = []
    cols.each do |col|
      line << h.send(col.to_sym)
    end
    if not h.changes_made.empty? then
      begin
        changes = JSON.parse(h.changes_made)
        changes.each do |k,v|
          line << "#{h.model_type}[#{k}]"
          line << v[0].to_s.gsub("\n","<CR>")
          line << v[1].to_s.gsub("\n","<CR>")
        end
      rescue
        line << "Failed to parse JSON #{$!.inspect}"
      end
    end
    lines << line.join("\t")
   end
   return lines.join("\n")
  end
  def items_csv(items)
    cols = [ :id, :class, :hidden, :name,:price]
    lines = []
    lines << cols.join("\t")
    items.each do |item|
      line = []
      cols.each do |col|
        line << item.send(col.to_sym)
      end
      lines << line.join("\t")
    end
    return lines.join("\n")
  end
  def orders_csv(orders)
    lines = []
    orders.each do |order|
      line = []
      [:id,:class,:sum,:refund_sum].each do |cc|
        line << order.send(cc)
      end
      lines << line.join("\t")
      order.items.each do |oi|
        line = []
        [:id,:class,:order_id,:full_price].each do |c|
          line << oi.send(c)
        end
        lines << line.join("\t")
        oi.options.each do |opt|
          line = []
          [:id,:class,:name,:price].each do |oc|
            line << opt.send(oc)
          end
          lines << line.join("\t")
        end
      end
      line = []
      [:id,:class,:order_id,:revenue,:finished,:initial_cash].each do |c|
        line << order.settlement.send(c) if order.settlement
      end
      lines << line.join("\t")
      line = []
      [:id,:class,:name,:description].each do |c|
        line << order.cost_center.send(c) if order.cost_center
      end
      lines << line.join("\t")
    end # orders.each
    return lines.join("\n")
  end
end
