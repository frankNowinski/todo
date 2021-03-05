# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :list, optional: true

  # TODO: Fix bug adding lists to each update
  accepts_nested_attributes_for :list

  scope :completed_tasks, -> { where(completed: true) }
  scope :incompleted_tasks, -> { where(completed: false) }

  has_paper_trail

  FILTER_TASKS_STATES = {
    "Incompleted Tasks" => :incompleted_tasks,
    "Completed Tasks" => :completed_tasks,
    "Both" => :tasks
  }

end
