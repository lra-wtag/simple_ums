require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do

  let!(:dept) do
    create(:department, name: 'CSE', head_name: 'Dr. Mahady Hasan',  position: '1', description: 'Computer Science and Engineering', capacity: '450')
  end

  describe 'GET #index' do
    let!(:eee) { create(:department, name: 'EEE') }

    it 'displays an array of all departments' do
      get :index
      expect(assigns(:departments)).to match_array [dept, eee]
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'displays the requested department to @department' do
      get :show, params: {id: dept}
      expect(assigns(:department)).to eq dept
    end

    it 'renders the :show template' do
      get :show, params: {id: dept}
      expect(response).to render_template :show
    end
  end

  describe'GET #new' do
    it 'assigns a new Department to @department' do
      get :new
      expect(assigns(:department)).to be_a_new(Department)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:department, name: 'DM', head_name: 'Laila Nushrat', position: '2', description: 'Department of Mathematics', capacity: '450')
      end

      it 'saves the new department in the database' do
        expect {
          post :create, params: {department: valid_attributes}
        }.to change(Department, :count).by(1)
      end

      it 'redirects to the departments#index' do
        patch :update, params: { id: dept, department: valid_attributes }
        expect(response).to redirect_to departments_path(dept)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:department, name: 'nil', head_name: 'Laila Nushrat', position: '2', description: 'Department of Mathematics', capacity: '450')
      end

      it 'does not save the new department in the database' do
        expect {
          post :create, params: {department: invalid_attributes}
        }.to change(Department, :count)
      end

      it 'redirects to the departments#index' do
        patch :update, params: { id: dept, department: invalid_attributes }
        expect(response).to redirect_to departments_path(dept)
      end
    end

  end

  describe 'GET #edit'do
    it 'assigns the requested department to @department' do
      get :edit, params: {id: dept}
      expect(assigns(:department)).to eq dept
    end

    it 'renders the :edit template' do
      get :edit, params: {id: dept}
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:department, name: 'DE', head_name: 'Dr. Jafar Iqbal', position: '3', description: 'Department of English', capacity: '250')
      end

      it 'locates the requested department' do
        patch :update, params: { id: dept, department: valid_attributes }
        expect(assigns(:department)).to eq(dept)
      end

      it 'updates the new department in the database' do
        patch :update, params: { id: dept, department: valid_attributes }
        dept.reload
        expect(dept.name).to eq('DE')
        expect(dept.head_name).to eq('Dr. Jafar Iqbal')
        expect(dept.position).to eq(3)
        expect(dept.description).to eq('Department of English')
        expect(dept.capacity).to eq(250)
      end

      it 'redirects to the updated departments#index' do
        patch :update, params: { id: dept, department: valid_attributes }
        expect(response).to redirect_to departments_path(dept)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:department, name: 'CSE', head_name: nil, position: '1', description: nil, capacity: '450')
      end

      it 'does not update the new department' do
        patch :update, params: { id: dept, department: invalid_attributes }
        dept.reload
        expect(dept.name).to eq('CSE')
        expect(dept.head_name).to eq('Dr. Mahady Hasan')
        expect(dept.position).to eq(1)
        expect(dept.description).to eq('Computer Science and Engineering')
        expect(dept.capacity).to eq(450)
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: dept, department: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'GET #delete' do
    it 'displays a delete message for @department' do
      get :delete, params: { id: dept }
      expect(assigns(:department)).to eq dept
    end

    it 'renders the :delete template' do
      get :delete, params: { id: dept }
      expect(response).to render_template :delete
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the department' do
      expect{ delete :destroy, params: { id: dept} }.to change(Department, :count).by(-1)
    end

    it 'redirects to schools#index' do
      delete :destroy, params: { id: dept}
      expect(response).to redirect_to departments_path
    end
  end


  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #delete" do
  #   it "returns http success" do
  #     get :delete
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
