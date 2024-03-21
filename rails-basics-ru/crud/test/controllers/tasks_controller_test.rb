require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @task = tasks(:one)
    @attrs = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }
  end

  test "should be get all tasks" do
    get tasks_url
    assert_response :success
  end

  test "should be get new" do
    get new_task_url
    assert_response :success
  end

  test "should be create new task" do
    post tasks_path, params: { task: @attrs }
    created_task = Task.find_by(name: @attrs[:name])

    assert_response :redirect
    assert_equal "Task created successfully", flash[:success]
    assert_redirected_to task_url(created_task)
  end

  test "should be save task without title" do
    post tasks_url, params: { task: { creator: Faker::Name.name }}

    assert_response :success
    assert_equal "Task creation failed", flash[:failure]
  end
end
