import VueRouter from 'vue-router';
import routes from './routes';
import goTo from 'vuetify/es5/services/goto';
import store from '../src/store/store';
import jwt_decode from 'jwt-decode';

const router = new VueRouter({
  routes,
  mode: 'history',
  base: process.env.BASE_URL,
  linkExactActiveClass: 'nav-item active',
  scrollBehavior(to, from, savedPosition) {
    let scrollTo = 0;
    if (to.hash) {
      scrollTo = to.hash;
    } else if (savedPosition) {
      scrollTo = savedPosition.y;
    }
    return goTo(scrollTo);
  }
});

router.beforeEach((to, from, next) => {
  const token = store.getters.user.token;
  if (to.matched.some(record => record.meta.requiresAuth)) {
    if(token == null) {
      next({
        path: '/login',
        params: { nextUrl: to.fullPath }
      });
    } else {
      const decoded = jwt_decode(token);
      const exp = decoded.exp * 1000; // Expires at (EXP)
      // If the token is expired, log out and redirect to login
      if(new Date().getTime() > exp) {
        store.dispatch('removeUserData');
        next({
          path: '/login',
          params: { nextUrl: to.fullPath }
        });
      }
      next();
    }
  } else if (to.matched.some(record => record.meta.guest)) {
    if (token == null) {
      next();
    } else {
      next({ 
        name: ''
      });
    }
  } else {
    next();
  }
});

export default router;