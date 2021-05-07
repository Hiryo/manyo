require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
=======
  test "should get index" do
    get tasks_index_url
>>>>>>> 277891f78570df6c27c792c2c86aac18a4a53f27
    assert_response :success
  end

  test "should get new" do
<<<<<<< HEAD
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { detail: @task.detail, name: @task.name } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
=======
    get tasks_new_url
    assert_response :success
  end

  test "should get show" do
    get tasks_show_url
>>>>>>> 277891f78570df6c27c792c2c86aac18a4a53f27
    assert_response :success
  end

  test "should get edit" do
<<<<<<< HEAD
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { detail: @task.detail, name: @task.name } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
=======
    get tasks_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get tasks_confirm_url
    assert_response :success
  end

>>>>>>> 277891f78570df6c27c792c2c86aac18a4a53f27
end
