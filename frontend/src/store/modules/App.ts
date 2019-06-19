import {IUser} from "@/interfaces/IUser";

export interface IAppState {
  user: IUser|null;
  isLoggedIn: boolean;
}

const state: IAppState = {
  user: null,
  isLoggedIn: false,
};

const mutations = {
  SET_USER (state: IAppState, user: IUser) {
    state.user = user
  },
  SET_LOGGEDIN (state: IAppState, isLoggedIn: boolean) {
    state.isLoggedIn = isLoggedIn
  },
};

const actions = {};

export default {
  state,
  mutations,
  actions
}
