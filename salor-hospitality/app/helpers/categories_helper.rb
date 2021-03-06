# coding: UTF-8

# Copyright (c) 2012 Red (E) Tools Ltd.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module CategoriesHelper

  def get_icon_array
    [
      [t('.aperitif'), 'aperitif'],
      [t('.sidedish'), 'sidedish'],
      [t('.starter'), 'starter'],
      [t('.soup'), 'soup'],
      [t('.maindish'), 'maindish'],
      [t('.fish'), 'fish'],
      [t('.pizza'), 'pizza'],
      [t('.noodles'), 'noodles'],
      [t('.salad'), 'salad'],
      [t('.childrendish'), 'childrendish'],
      [t('.dessert'), 'dessert'],
      [t('.digestif'), 'digestif'],
      [t('.beer'), 'beer'],
      [t('.nonalcoholics'), 'nonalcoholics'],
      [t('.cigarette'), 'cigarette'],
      [t('.rosewineglass'), 'rosewineglass'],
      [t('.redwineglass'), 'redwineglass'],
      [t('.whitewineglass'), 'whitewineglass'],
      [t('.rosewinebottle'), 'rosewinebottle'],
      [t('.redwinebottle'), 'redwinebottle'],
      [t('.whitewinebottle'), 'whitewinebottle'],
      [t('.sparkling'), 'sparkling'],
      [t('.coffee'), 'coffee'],
      [t('.teapot'), 'teapot'],
      [t('.tea'), 'tea'],
      [t('.blank'), 'blank']
    ]
  end

  def get_color_array
    [
      [t(:violet), '#80477d'],
      [t(:orange), '#ed8b00'],
      [t(:pink), '#cd0052'],
      [t(:green), '#75b10d'],
      [t(:blue), '#136880'],
      [t(:blank), '#27343b']
    ]
  end

  def generate_item_style
    "
      option[value='aperitif']:before { content:url('/images/category_aperitif.png'); }
      option[value='sidedish']:before { content:url('/images/category_sidedish.png'); }
      option[value='starter']:before { content:url('/images/category_starter.png'); }
      option[value='soup']:before { content:url('/images/category_soup.png'); }
      option[value='maindish']:before { content:url('/images/category_maindish.png'); }
      option[value='fish']:before { content:url('/images/category_fish.png'); }
      option[value='pizza']:before { content:url('/images/category_pizza.png'); }
      option[value='noodles']:before { content:url('/images/category_noodles.png'); }
      option[value='salad']:before { content:url('/images/category_salad.png'); }
      option[value='childrendish']:before { content:url('/images/category_childrendish.png'); }
      option[value='dessert']:before { content:url('/images/category_dessert.png'); }
      option[value='digestif']:before { content:url('/images/category_digestif.png'); }
      option[value='beer']:before { content:url('/images/category_beer.png'); }
      option[value='nonalcoholics']:before { content:url('/images/category_nonalcoholics.png'); }
      option[value='cigarette']:before { content:url('/images/category_cigarette.png'); }
      option[value='rosewineglass']:before { content:url('/images/category_rosewineglass.png'); }
      option[value='redwineglass']:before { content:url('/images/category_redwineglass.png'); }
      option[value='whitewineglass']:before { content:url('/images/category_whitewineglass.png'); }
      option[value='rosewinebottle']:before { content:url('/images/category_rosewinebottle.png'); }
      option[value='redwinebottle']:before { content:url('/images/category_redwinebottle.png'); }
      option[value='whitewinebottle']:before { content:url('/images/category_whitewinebottle.png'); }
      option[value='sparkling']:before { content:url('/images/category_sparkling.png'); }
      option[value='coffee']:before { content:url('/images/category_coffee.png'); }
      option[value='teapot']:before { content:url('/images/category_teapot.png'); }
      option[value='tea']:before { content:url('/images/category_tea.png'); }
      option[value='blank']:before { content:url('/images/category_blank.png'); }
      
      option[value='#80477d']:before { content:url('/images/color_violet.png'); }
      option[value='#ed8b00']:before { content:url('/images/color_orange.png'); }
      option[value='#cd0052']:before { content:url('/images/color_pink.png'); }
      option[value='#75b10d']:before { content:url('/images/color_green.png'); }
      option[value='#136880']:before { content:url('/images/color_blue.png'); }
      option[value='#27343b']:before { content:url('/images/color_blank.png'); }
    "
  end

end
