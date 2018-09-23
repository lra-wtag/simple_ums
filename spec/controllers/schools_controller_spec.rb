require 'rails_helper'
RSpec.describe SchoolsController, type: :controller do
  let!(:sch) do
    create(:school, name: 'School of Law', dean_name: 'Rifat Reza',  position: '5')
  end

  describe 'GET #index' do
    let!(:photo) { create(:school, name: 'Photography School') }

    it 'populates an array of all schools' do
      get :index
      expect(assigns(:schools)).to match_array [sch, photo]
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'displays the requested school to @school' do
      get :show, params: { id: sch }
      expect(assigns(:school)).to eq sch
    end

    it 'renders the :show template' do
      get :show, params: { id: sch }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new School to @school' do
      get :new
      expect(assigns(:school)).to be_a_new(School)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested school to @school' do
      get :edit, params: { id: sch }
      expect(assigns(:school)).to eq sch
    end

    it 'renders the :edit template' do
      get :edit, params: { id: sch }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:school, name: 'School of Animal Science', dean_name: 'Jawad Chowdhury', position: '9')
      end

      it 'locates the requested school' do
        patch :update, params: { id: sch, school: valid_attributes }
        expect(assigns(:school)).to eq(sch)
      end

      it 'updates the new school in the database' do
        patch :update, params: { id: sch, school: valid_attributes }
        sch.reload
        expect(sch.name).to eq('School of Animal Science')
        expect(sch.dean_name).to eq('Jawad Chowdhury')
        expect(sch.position).to eq(9)
      end

      it 'redirects to the updated schools#index' do
        patch :update, params: { id: sch, school: valid_attributes }
        expect(response).to redirect_to schools_path(sch)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        attributes_for(:school, name: 'School of Law', dean_name: nil ,  position: '8')
      end

      it 'does not update the new school' do
        patch :update, params: { id: sch, school: invalid_attributes }
        sch.reload
        expect(sch.name).to eq('School of Law')
        expect(sch.dean_name).to eq('Rifat Reza')
        expect(sch.position).to eq(5)
      end

      it 're-renders the :edit template' do
        patch :update, params: { id: sch, school: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'GET #delete' do
    it 'displays a delete message for @school' do
      get :delete, params: { id: sch }
      expect(assigns(:school)).to eq sch
    end

    it 'renders the :delete template' do
      get :delete, params: { id: sch }
      expect(response).to render_template :delete
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the school' do
      expect{ delete :destroy, params: { id: sch } }.to change(School, :count).by(-1)
    end

    it 'redirects to schools#index' do
      delete :destroy, params: { id: sch }
      expect(response).to redirect_to schools_path
    end
  end
end

