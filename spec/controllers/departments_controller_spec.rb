require 'rails_helper'
RSpec.describe DepartmentsController, type: :controller do
  let!(:school1) do
    create(:school,
           name: 'School of Road')
  end
  let!(:dept) do
    create(:department,
           name: 'ETE',
           head_name: 'Kawser',
           position: '2',
           description: 'Electronic and Telecommunication Engineering',
           capacity: '200',
           school_id: school1.id )
  end

  describe 'GET #index' do
    let!(:dept_1) { create(:department,
                           name: 'BBA',
                           head_name: 'rasel',
                           position: '2',
                           description: 'llaaalalaa',
                           capacity: '200',
                           school_id: school1.id)
    }

    it 'populates an array of all departments' do
      get :index, params: { school_id: school1.id }
      expect(assigns(:departments)).to match_array [ dept, dept_1 ]
    end

    it 'renders the :index template' do
      get :index, params: { school_id: school1.id }
      expect(response).to render_template :index
    end
   end

   describe 'GET #show' do
    it 'displays the requested department to @department' do
      get :show, params: { id: dept }
      expect(assigns(:department)).to eq dept
    end

    it 'renders the :show template' do
      get :show, params: { id: dept }
      expect(response).to render_template :show
    end
   end

  describe 'GET #new' do
    it 'assigns a new Department to @school' do
      get :new, params: { school_id: school1.id }
      expect(assigns(:department)).to be_a_new(Department)
    end

    it 'renders the :new template' do
      get :new, params: { school_id: school1.id }
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:department,
                       name: 'CAR',
                       head_name: 'Jawad ',
                       position: '9',
                       description: 'Dept of Car',
                       capacity: '100',
                       school_id: school1.id )
      end

      it 'saves the new department in the database' do
        expect {
          post :create,
               params: { department: valid_attributes,
                         school_id: school1.id  }
        }.to change(Department, :count).by(1)
      end

      it 'redirects to departments#index' do
        post :create, params: { department: valid_attributes,
                                school_id: school1.id }
        expect(response).to redirect_to departments_path(school_id: school1.id)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:department,
                       name: nil ,
                       head_name: 'Laila',
                       position: '3',
                       description: 'General Management',
                       capacity: '150',
                       school_id: school1.id )
      end

      it 'does not save the new department in the database' do
        expect {
          post :create,
               params: { department: invalid_attributes,
                         school_id: school1.id  }
        }.not_to change(Department, :count)
      end

      it 'renders the :new template' do
        post :create, params: { department: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested department to @school' do
      get :edit, params: { id: dept, school_id: school1.id }
      expect(assigns(:department)).to eq dept
    end

    it 'renders the :edit template' do
      get :edit, params: { id: dept, school_id: school1.id }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:department,
                       name: 'Animal Science',
                       head_name: 'Jawad',
                       position: '7',
                       description: 'Dept of Animal Science',
                       capacity: '80',
                       school_id: school1.id)
      end

      it 'locates the requested department' do
        patch :update, params: { id: dept,
                                 department: valid_attributes,
                                 school_id: school1.id }
        expect(assigns(:department)).to eq(dept)
      end

      it 'updates the new department in the database' do
        patch :update, params: { id: dept,
                                 department: valid_attributes,
                                 school_id: school1.id }
        dept.reload
        expect(dept.name).to eq('Animal Science')
        expect(dept.head_name).to eq('Jawad')
        expect(dept.position).to eq(7)
        expect(dept.description).to eq('Dept of Animal Science')
        expect(dept.capacity).to eq(80)
      end

      it 'redirects to the updated departments#index' do
        patch :update, params: { id: dept, department: valid_attributes, school_id: school1.id }
        expect(response).to redirect_to departments_path(dept, school_id: school1.id)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:department,
                       name: nil,
                       head_name: 'Kawser',
                       position: '2',
                       description: 'Electronic and Telecommunication Engineering',
                       capacity: '200',
                       school_id: school1.id)
      end

      it 'does not update the new department' do
        patch :update, params: { id: dept, department: invalid_attributes, school_id: school1.id  }
        dept.reload
        expect(dept.name).to eq('ETE')
        expect(dept.head_name).to eq('Kawser')
        expect(dept.position).to eq(2)
        expect(dept.description).to eq('Electronic and Telecommunication Engineering')
        expect(dept.capacity).to eq(200)
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: dept, department: invalid_attributes, school_id: school1.id }
        expect(response).to render_template :edit
      end
    end
   end

  describe 'GET #delete' do
    it 'displays a delete message for @department' do
      get :delete, params: { id: dept,
                             school_id: school1.id }
      expect(assigns(:department)).to eq dept
    end

    it 'renders the :delete template' do
      get :delete, params: { id: dept,
                             school_id: school1.id }
      expect(response).to render_template :delete
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the department' do
      expect{ delete :destroy, params: { id: dept,
                                         school_id: school1.id }
      }.to change(Department, :count).by(-1)
    end

    it 'redirects to departments#index' do
      delete :destroy, params: { id: dept,
                                 school_id: school1.id }
      expect(response).to redirect_to departments_path(school_id: school1.id)
    end
  end
end
