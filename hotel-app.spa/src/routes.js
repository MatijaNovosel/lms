import Login from '@/views/Login/Login.vue';
import MainLayout from '@/layouts/Main.vue';
import Index from '@/views/Index.vue';
import Subjects from '@/views/Subjects.vue';
import Exams from '@/views/Exams.vue';
import SubjectPage from '@/views/SubjectPage.vue';

let commonPages = {
  path: '/',
  component: MainLayout,
  children: [{
    path: '',
    name: '',
    component: Index
  }, {
    path: 'home',
    name: 'home',
    component: Index
  }, {
    path: 'login',
    name: 'login',
    component: Login
  }]
};

let subjectPages = {
  path: '/subjects',
  component: MainLayout,
  children: [{
    path: '',
    name: 'subjects',
    component: Subjects
  }, {
    path: 'details/:id',
    name: 'subject-details',
    component: SubjectPage
  }]
};

let examPages = {
  path: '/exams',
  component: MainLayout,
  children: [{
    path: '',
    name: 'exams',
    component: Exams
  }]
};

const routes = [
  commonPages,
  subjectPages,
  examPages,
  {
    path: '*',
    redirect: "/home"
  }
];

export default routes;