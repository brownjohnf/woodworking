module Mercury
  module Authentication

    def can_edit?
      can? :update, Article
    end
  end
end
