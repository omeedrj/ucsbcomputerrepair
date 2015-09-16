class RepairPdf < Prawn::Document
  def initialize(repair)
    super()
    @repair = repair
    # header
    customer_and_device_info
    problem_description
    # footer

    # table_content
  end

  # Generic Size constraints
  #   (Cursor starts in top left corner)
  # Width: 0 - 550
  # Height: 0 - 725

  def header
    # Put Bookstore computers info here
    #This inserts an image in the pdf file and sets the size of the image
    # image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  end

  def customer_and_device_info
    # Lower position to give room for the header
    y_position = cursor - 50

    bounding_box([0, y_position], :width => 200, :height => 150) do
      text "Name", size: 13, style: :bold
      text "#{@repair.customer_first_name} #{@repair.customer_last_name}"
      text "Student ID/Perm #", size: 13, style: :bold
      text "#{@repair.customer_id_number}"
      text "Email", size: 13, style: :bold
      text "#{@repair.customer_email}"
      text "Phone Number", size: 13, style: :bold
      text "#{@repair.customer_phone_number}"
    end

    bounding_box([225, y_position], :width => 300, :height => 150) do
      text "Device Description", size: 13, style: :bold
      text "#{@repair.device_description}"
      text "Serial #", size: 13, style: :bold
      text "#{@repair.device_serial_number}"
      text "Accessories", size: 13, style: :bold
      text "#{@repair.accessories_description}"
    end
  end

  def problem_description
    y_position = cursor

    bounding_box([0, y_position], :width => 550, :height => 300) do
      text "Problem Description", size: 13, style: :bold
      text "#{@repair.device_problem_description}"
    end
  end

  def footer

  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    # table product_rows do
    #   row(0).font_style = :bold
    #   self.header = true
    #   self.row_colors = ['DDDDDD', 'FFFFFF']
    #   self.column_widths = [40, 300, 200]
    # end
  end

  def product_rows
    # [['#', 'Name', 'Price']] +
    #   @products.map do |product|
    #   [product.id, product.name, product.price]
    # end
  end
end