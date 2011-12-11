# BillGastro -- The innovative Point Of Sales Software for your Restaurant
# Copyright (C) 2011  Michael Franzl <michael@billgastro.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class User < ActiveRecord::Base
  #include Scope
  #include Base
  has_many :settlements
  has_many :orders
  has_many :companies
  #has_many :employees, :class_name => "User", :foreign_key => :owner_id
  #belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  belongs_to :role
  has_and_belongs_to_many :tables
  validates_presence_of :login, :password, :title


  scope :aaa, lambda{ |user| where("company_id = #{ user.company_id  }")}


  def tables_array=(ids)
    self.tables = []
    ids.each do |id|
      self.tables << Table.find_by_id(id.to_i)
    end
  end
end
