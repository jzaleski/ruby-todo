module TodosHelper
  def current_list
    if @user && @list
      @list
    end
  end

  def previous_list
    if @user && @list
      index = list_index - 1
      index < 0 ? nil : @user.lists[index]
    end
  end


  def next_list
    if @user && @list
      index = list_index + 1
      index < 0 ? nil : @user.lists[index]
    end
  end

  private

  def list_index
    @user.lists.index(@list)
  end
end
