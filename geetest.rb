require 'watir'
class CrackVerification

  def initialize
      @html = Watir::Browser.new(:chrome)
    # @html =  Watir::Browser.new(:phantomjs)
  end

  def open_url(url)
    page = Watir::Browser.new(:chrome)
    # page=  Watir::Browser.new(:phantomjs)
    page.goto(url)
    return  page
  end

  ##搜索关键词
  def search(keyword)
    @html.goto("http://www.gsxt.gov.cn/index.html")

    # 输入关键词
    element = @html.driver.find_element(:id => "keyword")
    element.send_keys keyword
    sleep(2)

    # 点击搜索按钮
    dom_btn_query = @html.driver.find_element(:id => "btn_query")
    dom_btn_query.click()
    sleep(1)
  end

  ##获取原始图
  def get_image(class_name)
    image_fullbg_slice = @html.driver.find_element(:class=> class_name)
    div_style = image_fullbg_slice.attribute('style')
    if div_style =~ /"(.*)"/
      image_url_fullbg_slice = $1
      puts image_url_fullbg_slice
    else
      puts "%s" % "没有匹配到#{class_name}的图片"
    end
  end


  def main keyword
    #搜索关键词
    search keyword

    # 下载完整的验证图
    image_fullbg_slice = get_image "gt_cut_fullbg_slice"

    # 下载带有缺口的验证码图片
    image_bg_slice =  get_image "gt_cut_bg_slice"

  end
end
cv = CrackVerification.new
cv.main('蔓草')